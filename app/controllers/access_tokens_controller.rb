class AccessTokensController < ApplicationController
#Using the user_authenticator service in '../lib/user_authenticator.rb'
#The 'perform' method is from this service

#Also, a lot of helper methods were deposited in applications_controller.rb and we inherited them.

  skip_before_action :authorize!, only: :create

  def create
    authenticator = UserAuthenticator.new(params[:code])
    authenticator.perform
    #This was the big bug I had earlier with AccessTokenSerializer
    render json: AccessTokenSerializer.new(authenticator.access_token), status: :created
  end

  def destroy
    current_user.access_token.destroy
  end

  private

  def authentication_params
    (standard_auth_params || params.permit(:code)).to_h.symbolize_keys
  end

  def standard_auth_params
    params.dig(:data, :attributes)&.permit(:login, :password)
  end

end

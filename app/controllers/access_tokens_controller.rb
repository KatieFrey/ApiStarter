class AccessTokensController < ApplicationController
#Using the user_authenticator service in '../lib/user_authenticator.rb'
#The 'perform' method is from this service

#Also, a lot of helper methods were deposited in applications_controller.rb and we inherited them.
  def create
    authenticator = UserAuthenticator.new(params[:code])
    authenticator.perform

    render json: authenticator.access_token, status: :created
  end

end

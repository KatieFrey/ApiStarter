require 'rails_helper'

shared_examples_for 'forbidden_requests' do
  let(:authorization_error) do
    {
      "status": "403",
      "source": { "pointer": "/headers/authorization" },
      "title":  "Not Authorized",
      "detail": "You have no permission to access this resource."
    }
  end

  #403 means forbidden error
  it 'should return 403 status code' do
    subject
    expect(response).to have_http_status(:forbidden)
  end

  it 'should return proper error json' do
    subject
    expect(json['errors']).to eq(authorization_error)
  end
end

shared_examples_for "unauthorized_requests" do
  let(:authentication_error) do
    {
      "status": "401",
      "source": { "pointer": "/code" },
      "title":  "Authentication Code is Invalid",
      "detail": "You must provide valid code in order to exchange it for token."
    }
  end

  it 'should return 401 status code' do
    subject
    expect(response).to have_http_status(401)
  end

  it 'should return proper error body' do
    subject
    expect(json['errors']).to include(authentication_error)
  end

end

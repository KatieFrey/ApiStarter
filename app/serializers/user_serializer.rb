class ApplicationSerializer
  include FastJsonapi::ObjectSerializer
end

class UserSerializer < ApplicationSerializer
  attributes :login, :avatar_url, :url, :name
end

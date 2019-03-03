class AccessTokenSerializer
  include FastJsonapi::ObjectSerializer
  attributes :token
end

# class AccessTokenSerializer < ActiveModel::Serializer
#   attributes :id, :token
# end

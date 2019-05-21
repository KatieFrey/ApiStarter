class CommentSerializer < ActiveModel::CommentSerializer
  attributes :id, :content
  has_one :article
  has_one :user
end

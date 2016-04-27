class CommentSerializer < ActiveModel::Serializer
  attributes :challenge, :commenter, :content
end
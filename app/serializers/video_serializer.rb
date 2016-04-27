class VideoSerializer < ActiveModel::Serializer
  attributes :title, :data_content, :user, :challenge
end
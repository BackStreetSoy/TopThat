class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :about_me, :avatar, :wins, :losses, :ties
end
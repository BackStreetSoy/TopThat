class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :about_me, :avatar, :wins, :losses, :ties
end
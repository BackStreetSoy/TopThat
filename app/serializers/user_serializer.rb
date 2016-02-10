class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :password_digest, :about_me, :avatar, :wins, :losses, :ties
end
class Comment < ActiveRecord::Base
    has_many :replies, as: :reponse 
    belongs_to :commenter, class_name: "User"
    belongs_to :challenge
end

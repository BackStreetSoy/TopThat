class Video < ActiveRecord::Base
    belongs_to :challenge
    belongs_to :user 
    has_many :vote
    has_many :voters, through: :votes
end

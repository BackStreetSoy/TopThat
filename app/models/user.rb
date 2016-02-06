class User < ActiveRecord::Base
    has_secure_password 
    
    has_many :videos
    has_many :challenges, through: :videos
    has_many :friendships 
    has_many :friends, through: :friendships, source: :friend
    has_many :inverse_friendships, class_name: "Friendship", foreign_key: :friend_id
    has_many :inverse_friends, through: :inverse_friendships, source: :user
    has_many :comments, foreign_key: :commenter_id
    has_one  :inbox
    has_many :inbox_messages, through: :inbox 
    has_many :messages, through: :inbox_messages
    has_many :sent_messages, class_name: "Message"
    has_many :instances_as_a_direct_opponent, class_name: "DirectOppent", foreign_key: :opponent_id
    has_many :challenges_as_opponent, through: :instances_as_a_direct_opponent, source: :challenge 
    has_many :votes, foreign_key: :voter_id
    has_many :voted_on_videos, through: :votes
    has_many :opponents, through: :challenges
    has_many :replies, foreign_key: :replier_id


    def all_friends 
        all_friends = []
        self.friends.each do |friend|
            all_friends << friend 
        end 

        self.inverse_friends.each do |inverse_friend|
            all_friends << inverse_friend
        end 

        return all_friends 
    end 

end



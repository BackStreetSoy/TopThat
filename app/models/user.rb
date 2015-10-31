class User < ActiveRecord::Base
    has_many :videos
    has_many :challenges, through: :videos
    has_many :friendships 
    has_many :added_friends, through: :friendships, source: :friend
    #determine whether to encapsulate friends in method or to produce seperate friendship records 
    has_many :friendships_as_friend, class_name: "Friendship", foreign_key: :friend_id
    has_many :inverse_friends, through: :friendships_as_friend, source: :user
    has_many :comments, foreign_key: :commenter_id
    has_one  :inbox
    has_many :inbox_messages, through: :inbox 
    has_many :messages, through: :inbox_messages
    has_many :sent_messages, class_name: "Message"
    has_many :instances_as_a_direct_opponent, class_name: "DirectOppent", foreign_key: :opponent_id
    has_many :challenges_as_opponent, through: :instances_as_a_direct_opponent, source: :challenge 
    has_many :votes, foreign_key: :voter_id
    has_many :voted_on_videos, through: :votes
    #test opponents association
    #output should be array of all direct opponents 
    has_many :opponents, through: :challenges
    has_many :replies, foreign_key: :replier_id


    def friends 
        friends = []
        self.added_friends.each do |added_friend|
            friends << added_friend 
        end 

        self.inverse_friends.each do |inverse_friend|
            friends << inverse_friend
        end 

        return friends 
    end 

end



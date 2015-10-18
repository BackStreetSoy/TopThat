class User < ActiveRecord::Base
    has_many :videos
    has_many :challenges, through: :videos
    has_many :friendships 
    has_many :friends, through: :friendships
    #determine whether to encapsulate friends in method or to produce seperate friendship records 
    has_many :friendships_as_friend, class_name: "Friendship", foreign_key: :friend_id
    has_many :users, through: :friendships_as_friend
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

end



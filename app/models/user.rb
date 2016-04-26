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
  has_many :votes, foreign_key: :voter_id
  has_many :voted_on_videos, through: :votes

  has_many :replies, foreign_key: :replier_id

  # Test opponents association
  # Output should be array of all direct opponents
  has_many :direct_challenges, foreign_key: :opponent_id
  has_many :challenges_as_opponent, through: :direct_challenges, source: :challenge
  has_many :opponents, through: :challenges

  # Mount the uploader
  mount_uploader :avatar, AvatarUploader

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

  def all_direct_challenges
    all_direct_challenges = [];

    self.challenges.each do |challenge|
      if challenge.direct_challenge
        all_direct_challenges << challenge
      end
    end

    self.challenges_as_opponent.each do |challenge_as_opponent|
      all_direct_challenges << challenge_as_opponent
    end

    all_direct_challenges
  end

end



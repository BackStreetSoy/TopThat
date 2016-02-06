class Challenge < ActiveRecord::Base
    has_many :videos
    has_many :users, through: :videos
    #test opponent association
    has_one :direct_challenge
    has_one :opponent, through: :direct_challenge
    has_many :comments

end

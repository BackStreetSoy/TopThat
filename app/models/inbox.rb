class Inbox < ActiveRecord::Base
    has_many :inbox_messages 
    belongs_to :user
end

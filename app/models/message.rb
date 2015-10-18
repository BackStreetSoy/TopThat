class Message < ActiveRecord::Base
    belongs_to :message_sender, class_name: "User"
    has_many :replies, as: :response
    has_many :inbox_messages
end

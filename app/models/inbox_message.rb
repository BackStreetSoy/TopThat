class InboxMessage < ActiveRecord::Base
    belongs_to :inbox
    belongs_to :message
end

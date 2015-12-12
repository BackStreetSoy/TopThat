class Reply < ActiveRecord::Base
    belongs_to :repliable, polymorphic: true 
    belongs_to :replier, class_name: "User"
end

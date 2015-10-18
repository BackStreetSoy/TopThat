class Reply < ActiveRecord::Base
    belongs_to :response, polymorphic: true 
    belongs_to :replier, class_name: "User"
end

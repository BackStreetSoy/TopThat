class DirectOppenent < ActiveRecord::Base
    belongs_to :challenge
    belongs_to :opponent, class_name: "User"
end

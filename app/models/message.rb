class Message < ApplicationRecord
    
    belongs_to :teacher
    belongs_to :student
    has_many   :comment
end

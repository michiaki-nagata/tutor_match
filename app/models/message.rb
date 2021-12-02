class Message < ApplicationRecord
    
    belongs_to :teacher
    belongs_to :student
    has_many   :comment
    has_one_attached :image
end

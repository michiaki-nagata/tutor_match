class Inquiry < ApplicationRecord
    with_options presence: true do
        validates :title, length: { maximum: 20 }
        validates :text, length: { maximum: 300 }
    end
end

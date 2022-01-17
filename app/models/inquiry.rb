class Inquiry < ApplicationRecord
    with_options presence: true do
        validates :name, length: {maximum:20}
        validates :email, length: {maximum:200}
        validates :title, length: { maximum: 20 }
        validates :text, length: { maximum: 300 }
    end
end

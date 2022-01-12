class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
         
  has_many :messages
  has_many :teachers
  belongs_to :student, optional: true
  has_one_attached :image
  
  with_options presence: true do
    validates :name, length: {maximum:20}
    validates :prefecture, length: {maximum:20}
    validates :city, length: {maximum:20}
    validates :email, length: {maximum:200}
    validates :gender
    validates :age, numericality: {less_than_or_equal_to: 100, greater_than_or_equal_to: 6}
  end
  validates :phone, uniqueness: true, allow_nil: true, length: {maximum:13}
  validates :teacher_id, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  
end

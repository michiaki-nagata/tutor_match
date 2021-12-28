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
  VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
  validates :phone, uniqueness: true, allow_nil: true, format: { with: VALID_PHONE_NUMBER_REGEX }
  
  def name
    [name].join(" ")
  end
end

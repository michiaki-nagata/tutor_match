require 'rails_helper'

RSpec.describe Student, type: :model do
  # 名前、年齢、性別、都道府県、市区町村、メール、パスワードがあれば有効な状態であること
  it 'is valid with a name, age, gender, prefecture, city, email, and password' do
    expect(FactoryBot.build(:student)).to be_valid
  end

  # 名前がなければ無効な状態であること
  it 'is invalid without a name' do
    student = FactoryBot.build(:student, name: nil)
    student.valid?
    expect(student.errors[:name]).to include("can't be blank")
  end

  # メールアドレスがなければ無効な状態であること
  it 'is invalid without an email address' do
    student = FactoryBot.build(:student, email: nil)
    student.valid?
    expect(student.errors[:email]).to include("can't be blank")
  end

  # 年齢がなければ無効な状態であること
  it 'is invalid without an age' do
    student = FactoryBot.build(:student, age: nil)
    student.valid?
    expect(student.errors[:age]).to include("can't be blank")
  end

  # 性別がなければ無効な状態であること
  it 'is invalid without a gender' do
    student = FactoryBot.build(:student, gender: nil)
    student.valid?
    expect(student.errors[:gender]).to include("can't be blank")
  end

  # 都道府県がなければ無効な状態であること
  it 'is invalid without a prefecture' do
    student = FactoryBot.build(:student, prefecture: nil)
    student.valid?
    expect(student.errors[:prefecture]).to include("can't be blank")
  end

  # 市区町村がなければ無効な状態であること
  it 'is invalid without a city' do
    student = FactoryBot.build(:student, city: nil)
    student.valid?
    expect(student.errors[:city]).to include("can't be blank")
  end

  # パスワードがなければ無効な状態であること
  it 'is invalid without a password' do
    student = FactoryBot.build(:student, password: nil)
    student.valid?
    expect(student.errors[:password]).to include("can't be blank")
  end

  # 重複したメールアドレスなら無効な状態であること
  it 'is invalid with a duplicate email address' do
    FactoryBot.create(:student, email: 'test@example.com')
    student = FactoryBot.build(:student, email: 'test@example.com')
    student.valid?
    expect(student.errors[:email]).to include('has already been taken')
  end
end

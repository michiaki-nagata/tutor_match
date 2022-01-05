require 'rails_helper'

RSpec.describe Teacher, type: :model do
    # 名前、年齢、性別、都道府県、市区町村、メール、パスワードがあれば有効な状態であること
    it "is valid with a name, age, gender, prefecture, city, email, and password" do
        expect(FactoryBot.build(:teacher)).to be_valid   
    end

    # 名前がなければ無効な状態であること
    it "is invalid without a name" do
        teacher = FactoryBot.build(:teacher, name: nil)
        teacher.valid?
        expect(teacher.errors[:name]).to include("can't be blank")
    end
    
    # メールアドレスがなければ無効な状態であること
    it "is invalid without an email address" do
        teacher = FactoryBot.build(:teacher, email: nil)
        teacher.valid?
        expect(teacher.errors[:email]).to include("can't be blank")
    end
    
    # 年齢がなければ無効な状態であること
    it "is invalid without an age" do
        teacher = FactoryBot.build(:teacher, age: nil)
        teacher.valid?
        expect(teacher.errors[:age]).to include("can't be blank")
    end
    
    # 性別がなければ無効な状態であること
    it "is invalid without a gender" do
        teacher = FactoryBot.build(:teacher, gender: nil)
        teacher.valid?
        expect(teacher.errors[:gender]).to include("can't be blank")
    end    
    
    # 都道府県がなければ無効な状態であること
    it "is invalid without a prefecture" do
        teacher = FactoryBot.build(:teacher, prefecture: nil)
        teacher.valid?
        expect(teacher.errors[:prefecture]).to include("can't be blank")
    end
    
    # 市区町村がなければ無効な状態であること
    it "is invalid without a city" do
        teacher = FactoryBot.build(:teacher, city: nil)
        teacher.valid?
        expect(teacher.errors[:city]).to include("can't be blank")
    end
    
    # パスワードがなければ無効な状態であること
    it "is invalid without a password" do
        teacher = FactoryBot.build(:teacher, password: nil)
        teacher.valid?
        expect(teacher.errors[:password]).to include("can't be blank")
    end
    
    
    # 重複したメールアドレスなら無効な状態であること
    it "is invalid with a duplicate email address" do
        FactoryBot.create(:teacher, email: "test@example.com")
        teacher = FactoryBot.build(:teacher, email: "test@example.com")
        teacher.valid?
        expect(teacher.errors[:email]).to include("has already been taken")
    end
    
end
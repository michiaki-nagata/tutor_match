require 'rails_helper'

RSpec.describe Student, type: :model do
    # 名前、年齢、性別、都道府県、市区町村、メール、パスワードがあれば有効な状態であること
    it "is valid with a name, age, gender, prefecture, city, email, and password" do
        student = Student.new(
           name: "test",
           age: 13,
           gender: 1,
           prefecture: "test",
           city: "test",      
           email: "test@gmail.com",
           password: "testtest",
        ) 
        expect(student).to be_valid   
    end

    # 名前がなければ無効な状態であること
    it "is invalid without a name" do
        student = Student.new(name: nil)
        student.valid?
        expect(student.errors[:name]).to_not include("can't be blank")
    end
    
    # メールアドレスがなければ無効な状態であること
    it "is invalid without an email address" do
        student = Student.new(email: nil)
        student.valid?
        expect(student.errors[:email]).to_not include("can't be blank")
    end
    
    # 重複したメールアドレスなら無効な状態であること
    it "is invalid with a duplicate email address" do
        Student.create(
            name: "Joe",
            email: "tester@gmail.com",
            password: "tester",
        )
        student = Student.new(
            name: "Mike",
            email: "tester@gmail.com",
            password: "tester",
            )
        student.valid?
        expect(student.errors[:email]).to include("has already been taken")
    end
    
    
    # 生徒の名前を文字列として返すこと
    it "returns a student's name as a string" do
       student = Student.new(
           name: "Joe",
           email: "joe1234@gmail.com"
           )
        expect(student.name).to eq "Joe"
    end

end

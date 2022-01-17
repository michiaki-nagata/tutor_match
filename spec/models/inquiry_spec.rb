require 'rails_helper'

RSpec.describe Inquiry, type: :inquiry do
    #名前がなければ無効な状態であること
    it 'is invalid without a name' do
        inquiry = FactoryBot.build(:inquiry, name: nil)
        inquiry.valid?
        expect(inquiry.errors[:name]).to include("can't be blank")
    end
    #Eメールがなければ無効な状態であること
    it 'is invalid without a Eメール' do
        inquiry = FactoryBot.build(:inquiry, email: nil)
        inquiry.valid?
        expect(inquiry.errors[:email]).to include("can't be blank")
    end    
    #タイトルがなければ無効な状態であること
    it 'is invalid without a title' do
        inquiry = FactoryBot.build(:inquiry, title: nil)
        inquiry.valid?
        expect(inquiry.errors[:title]).to include("can't be blank")
    end    
    #テキストがなければ無効な状態であること
    it 'is invalid without a text' do
        inquiry = FactoryBot.build(:inquiry, text: nil)
        inquiry.valid?
        expect(inquiry.errors[:text]).to include("can't be blank")
    end
    
end
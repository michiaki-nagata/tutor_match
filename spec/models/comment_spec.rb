require 'rails_helper'

RSpec.describe Comment, type: :model do
    #テキストがなければ無効な状態であること
    it 'is invalid without a text' do
        comment = FactoryBot.build(:comment, text: nil)
        comment.valid?
        expect(comment.errors[:text]).to include("can't be blank")
    end
end

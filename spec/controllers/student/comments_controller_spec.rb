require 'rails_helper'

RSpec.describe Student::CommentsController, type: :request do

  before do
    @teacher = FactoryBot.create(:teacher)
    @student = FactoryBot.create(:student, teacher_id: @teacher.id)
    @message = FactoryBot.create(:message, teacher_id: @teacher.id, student_id: @student.id)
  end
  # ログインしていない場合
  context 'not auth' do
    describe '#create' do
      it 'redirect sign in page' do
        comment_params = FactoryBot.attributes_for(:comment, message_id: @message.id, sender: "Student")
        post student_comments_path, params:{comment: comment_params}
        expect(response.status).to redirect_to new_student_session_path
      end  
    end
  end

  # ログインしている場合
  context 'authenticated' do
    before do
      sign_in @student
    end

    describe '#create' do
      #失敗
      context 'validation error' do
        it '302 response' do
        comment_params = FactoryBot.attributes_for(:comment, text: nil, message_id: @message.id, sender: "Student")
        expect {
          post student_comments_path, params:{comment: comment_params}
        }.to eq(302)
        end  
        
        it 'response success' do

        end
      end
      
      #成功  
      context 'text sended' do
        it 'response success' do
        comment_params = FactoryBot.attributes_for(:comment, message_id: @message.id, sender: "Student")
        expect {
          post student_comments_path, params:{comment: comment_params}
        }.to change(@message.comments, :count).by(1)
        end
      end
    end
  end
end

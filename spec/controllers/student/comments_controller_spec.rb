require 'rails_helper'

RSpec.describe Student::CommentsController, type: :request do

  let(:teacher) {create(:teacher)}
  let(:student) {create(:student)}
  let(:message) {create(:message, teacher_id: teacher.id, student_id: student.id)}
  
  # ログインしていない場合
  context 'not auth' do
    describe '#create' do
      it 'redirect sign in page' do
        comment_params = FactoryBot.attributes_for(:comment, message_id: message.id, sender: "Student")
        post student_comments_path, params:{comment: comment_params}
        expect(response.status).to redirect_to new_student_session_path
      end  
    end
  end

  # ログインしている場合
  context 'authenticated' do
    before do
      sign_in student
    end

    describe '#create' do
      #失敗
      context 'validation error' do
        it 'redirect message page' do
          comment_params = FactoryBot.attributes_for(:comment, text: nil, message_id: message.id, sender: "Student")
          post student_comments_path, params:{comment: comment_params}
          expect(response.status).to redirect_to student_message_path(message.id)
        end  
        
        it 'not created comment' do
          comment_params = FactoryBot.attributes_for(:comment, text: nil, message_id: message.id, sender: "Student")
          expect {
            post student_comments_path, params:{comment: comment_params}
          }.to change(message.comments, :count).by(0)
        end
      end
      
      #成功  
      context 'text sended' do
        it 'created comment' do
        comment_params = FactoryBot.attributes_for(:comment, message_id: message.id, sender: "Student")
        expect {
          post student_comments_path, params:{comment: comment_params}
        }.to change(message.comments, :count).by(1)
        end
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Student::MessagesController, type: :request do
  
    let(:teacher) {create(:teacher)}
    let(:student) {create(:student)}
    let(:message) {create(:message, teacher_id: teacher.id, student_id: student.id)}
  
  # ログインしていない場合
  context 'not auth' do
    describe '#index' do
      it 'redirect sign in page' do
        get student_messages_path
        expect(response.status).to redirect_to new_student_session_path
      end
    end
  end

  # ログインしている場合
  context 'authenticated' do
    before do
      sign_in student
    end

    describe '#index' do
      it 'response success' do
        get student_messages_path
        expect(response.status).to eq(200)
      end
    end

    describe '#show' do
      it 'response 200' do
        get student_message_path(message.id)
        expect(response.status).to eq(200)
      end
      
    end

    describe '#create' do
      it 'create message' do
        message_params = FactoryBot.attributes_for(:message, teacher_id: teacher.id, student_id: student.id)
        expect {
          post student_messages_path, params:{ message: message_params}
        }.to change(student.messages, :count).by(1)
      end
    end
  end
end

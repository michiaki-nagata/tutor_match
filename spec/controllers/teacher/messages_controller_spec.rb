require 'rails_helper'

RSpec.describe Teacher::MessagesController, type: :request do
  
    let(:teacher) {create(:teacher)}
    let(:student) {create(:student)}
    let(:message) {create(:message, teacher_id: teacher.id, student_id: student.id)}

  # ログインしていない場合
  context 'not auth' do
    describe '#index' do
      it 'redirect sign in page' do
        get teacher_messages_path
        expect(response.status).to redirect_to new_teacher_session_path
      end
    end
  end

  # ログインしている場合
  context 'authenticated' do
    before do
      sign_in teacher
    end

    describe '#index' do
      it 'response success' do
        get teacher_messages_path
        expect(response.status).to eq(200)
      end
    end

    describe '#show' do
      it 'response 200' do
        get teacher_message_path(message.id)
        expect(response.status).to eq(200)
      end
      
    end

    describe '#create' do
      it 'create message' do
        message_params = FactoryBot.attributes_for(:message, teacher_id: teacher.id, student_id: student.id)
        expect {
          post teacher_messages_path, params:{ message: message_params}
        }.to change(teacher.messages, :count).by(1)
      end
    end
  end
end

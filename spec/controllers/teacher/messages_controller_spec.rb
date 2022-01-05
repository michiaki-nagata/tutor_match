require 'rails_helper'

RSpec.describe Teacher::MessagesController, type: :request do
  let(:teacher) { create(:teacher) }

  # ログインしていない場合
  context 'not auth' do
    describe '#index' do
      it 'redirect sign in page' do
        get 'teacher/messages'
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
      end
    end

    describe '#show' do
      it 'response success' do
      end
    end

    describe '#create' do
      it 'response success' do
      end
    end
  end
end

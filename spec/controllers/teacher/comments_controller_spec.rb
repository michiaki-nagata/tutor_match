require 'rails_helper'

RSpec.describe Teacher::CommentsController, type: :request do
  let(:teacher) { create(:teacher) }

  # ログインしていない場合
  context 'not auth' do
    describe '#create' do
      it 'redirect sign in page' do
        expect(response.status).to redirect_to new_teacher_session_path
      end
    end
  end

  # ログインしている場合
  context 'authenticated' do
    before do
      sign_in teacher
    end

    describe '#create' do
      context 'validation error' do
        let(:params) { { comments: { text: '' } } }
        it 'response success' do
          post '/teacher/messages', params: params
          expect(response.status).to eq(200)
        end
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Student::CommentsController, type: :request do
  let(:student) { create(:student) }

  # ログインしていない場合
  context 'not auth' do
    describe '#create' do
      it 'redirect sign in page' do
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
      context 'validation error' do
        let(:params) { { comments: { text: '' } } }
        it 'response success' do
          post '/student/messages', params: params
          expect(response.status).to eq(200)
        end
      end
    end
  end
end

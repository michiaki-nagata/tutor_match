require 'rails_helper'

RSpec.describe Teacher::ManagementsController, type: :request do
  let(:teacher) {create(:teacher)}

  # ログインしていない場合
  context 'not auth' do
    describe '#index' do
      it 'redirect sign in page' do
        get teacher_managements_path
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
        get teacher_managements_path
        expect(response.status).to eq(200)
      end
    end
  end
end

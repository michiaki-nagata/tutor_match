require 'rails_helper'

RSpec.describe Student::TeachersController, type: :request do
  let(:student) { create(:student) }

  # ログインしていない場合
  context 'not auth' do
    describe '#index' do
      it 'redirect sign in page' do
        get 'student/teachers'
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
        get student_teachers_path
        expect(response.status).to eq(200)
      end
    end

    describe '#search' do
      it 'response success' do
      end
    end

    describe '#show' do
      it 'response success' do
      end
    end
  end
end
require 'rails_helper'

RSpec.describe Student::StudentController, type: :request do
  # ログインしていない場合
  before do 
    @teacher = FactoryBot.create(:teacher)
    @student = FactoryBot.create(:student)
  end
  
  context 'not auth' do
    describe '#edit' do
      it 'redirect sign in page' do
        get edit_student_student_path(@teacher.id)
        expect(response.status).to redirect_to new_student_session_path
      end
    end
  end

  # ログインしている場合
  context 'authenticated' do
    before do
      sign_in @student
    end

    describe '#edit' do
      it 'response success' do
      end
    end

    describe '#update' do
      it 'response success' do
      end
    end
  end
end

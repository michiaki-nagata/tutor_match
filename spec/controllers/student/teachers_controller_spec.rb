require 'rails_helper'

RSpec.describe Student::TeachersController, type: :request do

  let(:teacher) {create(:teacher)}
  let(:student) {create(:student)}
  let(:message) {create(:message, teacher_id: teacher.id, student_id: student.id)}

  # ログインしていない場合
  context 'not auth' do
    describe '#index' do
      it 'redirect sign in page' do
        get student_teachers_path
        expect(response.status).to redirect_to new_student_session_path
      end
    end
    
    describe '#show' do
      it 'redirect sign in page' do
        get student_teacher_path(teacher.id)
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

    describe '#show' do
      it 'response success' do
        get student_teacher_path(teacher.id)
        expect(response.status).to eq(200)
      end
    end
  end
end

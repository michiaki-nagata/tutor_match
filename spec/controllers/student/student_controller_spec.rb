require 'rails_helper'

RSpec.describe Student::StudentController, type: :request do
  
  let(:teacher) {create(:teacher)}
  let(:student) {create(:student, teacher_id: teacher.id)}
  let(:message) {create(:message, teacher_id: teacher.id, student_id: student.id)}
    
  # ログインしていない場合
  context 'not auth' do
    describe '#edit' do
      it 'redirect sign in page' do
        get edit_student_student_path(student.teacher_id)
        expect(response.status).to redirect_to new_student_session_path
      end
    end
    
    describe 'update' do
      it 'redirect sign in page' do
        student_params = FactoryBot.attributes_for(:student, teacher_id: teacher.id)
        patch student_student_path(student.teacher_id), params:{student: student_params}
        expect(response.status).to redirect_to new_student_session_path
      end
    end
  end

  # ログインしている場合
  context 'authenticated' do
    before do
      sign_in student
    end

    describe '#edit' do
      it 'response success' do
        get edit_student_student_path(student.teacher_id)
        expect(response.status).to eq(200)
      end
    end

    describe '#update' do
      #失敗
      it 'does not update the project' do
        student_params = FactoryBot.attributes_for(:student, teacher_id: "あああ" )
        patch student_student_path(student.teacher_id), params:{student: student_params}
        expect(response.status).to redirect_to edit_student_student_path
      end
      
      #成功
      it 'update a student' do
        student_params = FactoryBot.attributes_for(:student, teacher_id: teacher.id)
        patch student_student_path(student.teacher_id), params:{student: student_params}
        expect(student.reload.teacher_id).to eq teacher.id
      end
    end
  end
end

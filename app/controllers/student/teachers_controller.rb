class Student::TeachersController < StudentController
  def index
    @q = Teacher.ransack(params[:q])
    @teachers = @q.result
  end

  def show
    @teacher = Teacher.find(params[:id])
    @message = current_student.messages.find_by(teacher_id: @teacher.id)
  end
end

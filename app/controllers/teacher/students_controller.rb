class Teacher::StudentsController < TeacherController
  before_action :index, only: %i[index search]

  def index
    @q = Student.ransack(params[:q])
    @students = @q.result
  end

  def show
    @student = Student.find(params[:id])
    @message = current_student.messages.find_by(student_id: @student.id)
  end
end

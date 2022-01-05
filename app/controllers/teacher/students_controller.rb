class Teacher::StudentsController < TeacherController
  before_action :index, only: %i[index search]

  def index
    @students = Student.all
    @q = Student.ransack(params[:q])
  end

  def search
    @q = Student.ransack(params[:q])
    @students = @q.result
  end

  def show
    @student = Student.find(params[:id])
    messages = current_teacher.messages
    @student_ids = []
    messages.each do |r|
      @student_ids << r.student_id
    end
    messages.each do |message|
      @message = message if message.student_id == @student.id
    end
  end
end

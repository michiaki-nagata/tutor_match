class Student::TeachersController < StudentController
  def index
    @q = Teacher.ransack(params[:q])
    @teachers = @q.result
  end

  def show
    @teacher = Teacher.find(params[:id])
    messages = current_student.messages
    @teacher_ids = []
    messages.each do |r|
      @teacher_ids << r.teacher_id
    end
    messages.each do |message|
      @message = message if message.teacher_id == @teacher.id
    end
  end
end

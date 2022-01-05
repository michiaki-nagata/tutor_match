class Student::MessagesController < StudentController
  def index
    @messages = current_student.messages
  end

  def show
    @message = current_student.messages.find(params[:id])
    @student = current_student
    @comment = Comment.new
    @comments = @message.comments
    if @message.student_id == current_student.id
      @teacher = @message.teacher
    else
      render 'index'
    end
  end

  def create
    message_params = params.require(:message).permit(:teacher_id, :student_id)
    @message = Message.new(message_params)
    if @message.save
      redirect_to student_message_path(@message)
    else
      render 'index'
    end
  end
end

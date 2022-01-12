class Student::MessagesController < StudentController
  def index
    @messages = current_student.messages
  end

  def show
    @message = current_student.messages.find(params[:id])
    @comment = Comment.new
  end

  def create
    message_params = params.require(:message).permit(:teacher_id)
    @message = current_student.messages.create(message_params)
    redirect_to student_message_path(@message)
  end
end

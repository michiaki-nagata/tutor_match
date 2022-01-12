class Teacher::MessagesController < TeacherController
  def index
    @messages = current_teacher.messages
  end

  def show
    @message = current_teacher.messages.find(params[:id])
    @comment = Comment.new
  end

  def create
    message_params = params.require(:message).permit(:student_id)
    @message = current_teacher.messages.create(message_params)
    redirect_to teacher_message_path(@message)
  end
end

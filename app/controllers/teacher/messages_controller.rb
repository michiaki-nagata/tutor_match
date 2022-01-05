class Teacher::MessagesController < TeacherController
  def index
    @messages = current_teacher.messages
  end

  def show
    @message = current_teacher.messages.find(params[:id])
    @teacher = current_teacher
    @comment = Comment.new
    @comments = @message.comments
    if @message.teacher_id == current_teacher.id
      @student = @message.student
    else
      render 'index'
    end
  end

  def create
    message_params = params.require(:message).permit(:teacher_id, :student_id)
    @message = Message.new(message_params)
    if @message.save
      redirect_to teacher_message_path(@message)
    else
      render 'index'
    end
  end
end

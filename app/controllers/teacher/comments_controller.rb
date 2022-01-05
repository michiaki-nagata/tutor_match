class Teacher::CommentsController < TeacherController
  def create
    comment_params = params.require(:comment).permit(:message_id, :text, :sender)
    @comment = Comment.new(comment_params)
    @comment.sender = 'Teacher'
    if @comment.save
      redirect_to teacher_message_path(@comment.message_id)
    else
      redirect_to '/student/messages'
    end
  end
end

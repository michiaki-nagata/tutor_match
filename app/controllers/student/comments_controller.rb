class Student::CommentsController < StudentController
  def create
    comment_params = params.require(:comment).permit(:message_id, :text, :sender)
    @comment = Comment.new(comment_params)
    @comment.sender = 'Stundent'
    if @comment.save
      redirect_to student_message_path(@comment.message_id)
    else
      redirect_to student_message_path(@comment.message_id)
    end
  end
end

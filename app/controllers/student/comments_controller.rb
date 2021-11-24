class Student::CommentsController < StudentController
    
    def create
        comment_params = params.require(:comment).permit(:message_id, :text, :sender)
        @comment = Comment.new(comment_params)
        @comment.student_id = current_user.id
       if @comment.save 
           redirect_to student_messages_path(1)
       else
           render "student/messages"
       end
    end
    
end

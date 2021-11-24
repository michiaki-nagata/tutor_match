class Teacher::CommentsController < TeacherController
    
    def create
        comment_params = params.require(:comment).permit(:message_id, :text, :sender)
        @comment = Comment.new(comment_params)
        @comment.teacher_id = current_user.id
       if @comment.save 
           redirect_to teacher_messages_path(1)
       else
           render "teacher/messages"
       end
    end
    
end

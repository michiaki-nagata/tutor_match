class Student::MessagesController < StudentController
   
   def index
      if current_student.id.to_i == params[:id].to_i
         @student = Student.find_by(id: params[:id])
         @message_student_ids = Message.where(teacher_id: @student.id).or(Message.where(teacher_id: @student.id)).distinct.pluck(:student_id)
         @message_student_ids.delete(@student.id)
      end
   end

   def show
      if current_student.id.to_i == params[:student_id].to_i
         @teacher_id = params[:teacher_id]
         @messages = Message.where(user_id: params[:student_id],teacher_id: @teacher_id).or(Message.where(student_id: params[:teacher_id],teacher_id: params[:student_id])).order(created_at: :asc)
         # unread_messages = Message.where(teacher_opentime: nil,teacher_id: current_user.id)
         # unread_messages.each do |unread_message|
         # unread_message.to_user_opentime = Date.today.to_time
         # unread_message.save
         # end
      end
   end
end
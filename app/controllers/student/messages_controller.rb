class Student::MessagesController < StudentController
   
   def index
      @messages = Message.all
   end
   
   def show
      @message = Messages.find(params[:id])
   end
   
end
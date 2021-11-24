class Teacher::StudentsController < TeacherController
    
    def index
        @students = Students.all
    end
    
    def show
        @student = Student.find(params[:id])
    end
end
class Teacher::StudentsController < TeacherController
    before_action :index, only: [:index, :search]
    
    def index
        @students = Student.all
        @q = Student.ransack(params[:q])
    end
    
    def search
        @q = Student.ransack(params[:q])
        @students = @q.result
    end
    
    def show
        @student = Student.find(params[:id])
    end
end

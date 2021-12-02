class Student::TeachersController < StudentController
    
    def index
        @teachers = Teacher.all
        @q = Teacher.ransack(params[:q])
    end
    
    def search
        @q = Teacher.ransack(params[:q])
        @teachers = @q.result
    end
    
    def show
        @teacher = Teacher.find(params[:id])
    end
    
end
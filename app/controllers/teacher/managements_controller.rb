class Teacher::ManagementsController < TeacherController
    
    def index
        @managements = Management.all
    end
    
    def show
        @management = Management.find(params[:id])
    end
end

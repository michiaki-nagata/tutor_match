class Teacher::ManagementsController < TeacherController
    
    def index
        @students = Student.all
        @responsible_student_ids = []
        @students.each do |student|
            if student.teacher_id == current_teacher.id
                @responsible_student_ids << student.teacher_id
            end
        end
    end
    
    def show
        @management = Management.find(params[:id])
    end
end

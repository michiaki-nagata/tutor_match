class Student::StudentController < StudentController
    
    def update
        teacher_params = params.require(:teacher).permit(:name)
        @teacher = Teacher.new(teacher_params)
        if @teacher.save
            redirect_to student_teachers_path
        else
            render "update"
        end
    end
end
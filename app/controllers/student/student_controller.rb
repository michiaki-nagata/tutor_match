class Student::StudentController < StudentController
  def edit
    @teacher = Teacher.find(params[:id])
    @student = current_student
  end

  def update
    student_params = params.require(:student).permit(:teacher_id)
    @teacher = Teacher.find(params[:id])
    @student = current_student
    if @student.update(student_params)
      redirect_to student_teacher_path(@teacher)
    else
      redirect_to edit_student_student_path(@teacher)
    end
  end
end

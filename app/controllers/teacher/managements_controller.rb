class Teacher::ManagementsController < TeacherController
  def index
    @management_students = current_teacher.students
  end
end

class StudentController < ApplicationController
  layout 'student'
  before_action :authenticate_student!
end

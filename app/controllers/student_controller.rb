class StudentController < ApplicationController
  before_action :authenticate_student!
end

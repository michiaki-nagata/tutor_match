class TeacherController < ApplicationController
  before_action :authenticate_teacher!
end

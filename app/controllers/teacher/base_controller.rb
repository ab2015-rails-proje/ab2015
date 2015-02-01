class Teacher::BaseController < ActionController::Base
  before_action :authenticate_teacher!
end
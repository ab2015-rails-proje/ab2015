class Teacher::UsersController < Teacher::BaseController
  add_breadcrumb 'Anasayfa', :teacher_dashboard_index_path
  def index
    @lesson = Lesson.find(params[:lesson_id])
    @users = @lesson.users
  end
end


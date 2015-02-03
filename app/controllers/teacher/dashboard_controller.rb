class Teacher::DashboardController < Teacher::BaseController
  def index
  	if current_teacher.active_for_authentication?
    end
    add_breadcrumb "Ana Sayfa", :teacher_dashboard_index_path
  end
end
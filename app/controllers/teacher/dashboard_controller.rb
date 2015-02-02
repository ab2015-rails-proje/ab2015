class Teacher::DashboardController < Teacher::BaseController
  def index
    add_breadcrumb "Ana Sayfa", :teacher_dashboard_index_path
  end
end
class Admin::TeachersController < Admin::BaseController
  before_action :set_teacher, only: [:show]
  add_breadcrumb "Teacher", :admin_teachers_path

	def index
		@search = Teacher.ransack(params[:q])
    @teacher = @search.result.paginate(page: params[:page])
  end

  def show 
     add_breadcrumb @teacher.name , admin_teacher_path(@teacher)
  end

  def block_all
    Teacher.update_all(blocked: true)
    flash[:success] = 'İşlem Başarılı'
    redirect_to :back
  end

	def block
    @teacher = Teacher.find(params[:id])
    @teacher.blocked = true
    if @teacher.save
      flash[:success] = 'Başarılı bir şekilde bloklandı.'
    else
      flash[:danger] = 'Bloklanamadı!'
    end
    redirect_to :back
  end

	def unblock
    @teacher = Teacher.find(params[:id])
    @teacher.blocked = false
    if @teacher.save
      flash[:success] = 'Başarılı bir şekilde aktif edildi.'
    else
      flash[:danger] = 'Aktif edilemedi.'
    end
    redirect_to :back
  end

private
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

end
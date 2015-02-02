class Admin::AdminsController < Admin::BaseController
  before_action :set_admin, only: [:show]
  add_breadcrumb "Admin", :admin_admins_path

	def index
		@search = Admin.ransack(params[:q])
    @admins = @search.result.paginate(page: params[:page])

  end

  def block_all
    Admin.update_all(blocked: true)
    flash[:success] = 'İşlem Başarılı'
    redirect_to :back
  end

	def block
    @admin = Admin.find(params[:id])
    @admin.blocked = true
    if @admin.save
      flash[:success] = 'Başarılı bir şekilde bloklandı.'
    else
      flash[:danger] = 'Bloklanamadı!'
    end
    redirect_to :back
  end

	def unblock
    @admin = Admin.find(params[:id])
    @admin.blocked = false
    if @admin.save
      flash[:success] = 'Başarılı bir şekilde aktif edildi.'
    else
      flash[:danger] = 'Aktif edilemedi.'
    end
    redirect_to :back
  end

private
    def set_Admin
      @admin = Admin.find(params[:id])
    end

end
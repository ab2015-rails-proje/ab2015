class Admin::AdminsController < Admin::BaseController
  before_action :set_admin, only: [:show]
  add_breadcrumb "Admin", :admin_admins_path

  respond_to :html

	def index
		@search = Admin.ransack(params[:q])
    @admins = @search.result.paginate(page: params[:page])

  end

  def create
    password = []
    8.times {password.push (33..126).to_a.sample.chr }

    @admin = Admin.new(admin_params)
    @admin.password = password.join
    @admin.password_confirmation = password.join
    @admin.save
    redirect_to admin_admins_path
  end

  def new
    @admin = Admin.new
    respond_with(:admin, @admin)
    add_breadcrumb "Yeni Admin", :new_admin_admin_path
  end

  def block_all
    Admin.all.each {|a| a.update(blocked: true) unless current_admin == @admin }
    flash[:success] = 'İşlem Başarılı'
    redirect_to :back
  end

	def block
    @admin = Admin.find(params[:id])
    unless current_admin == @admin
      @admin.blocked = true
      if @admin.save
        flash[:success] = 'Başarılı bir şekilde bloklandı.'
      else
        flash[:danger] = 'Bloklanamadı!'
      end
      redirect_to :back
    end
  end

	def unblock
    @admin = Admin.find(params[:id])
    unless current_admin == @admin
      @admin.blocked = false
      if @admin.save
        flash[:success] = 'Başarılı bir şekilde aktif edildi.'
      else
        flash[:danger] = 'Aktif edilemedi.'
      end
     redirect_to :back  
    end
  end

private
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:email)
    end
end
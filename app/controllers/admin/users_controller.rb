class Admin::UsersController < Admin::BaseController
  def index
	@search = User.ransack(params[:q])
    @users = @search.result.paginate(page: params[:page])
  end

  def block_all
    User.update_all(blocked: true)
    flash[:success] = 'İşlem Başarılı'
    redirect_to :back
  end

  def block
    @user = User.find(params[:id])
    @user.blocked = true
    if @user.save
      flash[:success] = 'Başarılı bir şekilde bloklandı.'
    else
      flash[:danger] = 'Bloklanamadı!'
    end
    redirect_to :back
  end

  def unblock
    @user = User.find(params[:id])
    @user.blocked = false
    if @user.save
      flash[:success] = 'Başarılı bir şekilde aktif edildi.'
    else
      flash[:danger] = 'Aktif edilemedi.'
    end
    redirect_to :back
  end
end

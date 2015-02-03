class Admin::AnnouncementsController < Admin::BaseController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]

  respond_to :html
  add_breadcrumb "Duyurular", :admin_announcements_path

  def index
    @announcements = Announcement.all.order('id desc')
    respond_with(:admin, @announcements)
  end

  def show
    add_breadcrumb @announcement.title, admin_announcement_path(@announcement)
    respond_with(:admin,@announcement)
  end
  def new
    @announcement = Announcement.new
    add_breadcrumb "Yeni Duyuru", :new_admin_announcement_path
    respond_with(:admin,@announcement)

  end

  def edit
  end

  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.save
    respond_with(:admin,@announcement)
  end

  def update
    @announcement.update(announcement_params)
    respond_with(:admin,@announcement)
  end

  def destroy
    @announcement.destroy
    respond_with(:admin,@announcement)
  end

  private
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    def announcement_params
      params.require(:announcement).permit(:title, :content, :file)
    end
end

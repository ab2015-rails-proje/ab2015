class AnnouncementsController < ApplicationController
  add_breadcrumb "Duyurular", :announcements_path

  def index
    @announcements=Announcement.all.order('id desc').limit(10)
  end

  def show
    @announcement=Announcement.find(params[:id])
    add_breadcrumb @announcement.title, announcement_path(@announcement)
  end
end

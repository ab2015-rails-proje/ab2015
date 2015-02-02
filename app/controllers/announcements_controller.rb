class AnnouncementsController < ApplicationController
  def index
    @announcements=Announcement.all.order('id desc').limit(10)
  end

  def show
    @announcement=Announcement.find(params[:id])
  end
end

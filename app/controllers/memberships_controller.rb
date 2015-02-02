class MembershipsController < ApplicationController
  before_action :authenticate_user!
  def create
    @lesson = Lesson.find(params[:lesson_id])
    @membership = current_user.memberships.create(lesson_id: @lesson.id)
    flash[:success] = "Eğitime kaydınız tamamlandı"
    redirect_to :back 
  end
end

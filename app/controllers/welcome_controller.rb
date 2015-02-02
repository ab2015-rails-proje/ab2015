class WelcomeController < ApplicationController
  def index
    @events=Event.all.order('id desc')
  end
end
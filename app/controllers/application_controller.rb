class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  rescue_from Exception, :with => :server_error

  def server_error(exception)
    respond_to do |format|
      format.html { render template: 'errors/internal_server_error', layout: 'layouts/application', status: 500 }
      format.all  { render nothing: true, status: 500}
    end
  end

  rescue_from ActiveRecord::RecordNotFound, :with => :page_not_found

  rescue_from ActionController::RoutingError, :with => :page_not_found

  def page_not_found
    respond_to do |format|
      format.html { render template: 'errors/not_found', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end


  end



  protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:sign_up) << :name
	  end


end

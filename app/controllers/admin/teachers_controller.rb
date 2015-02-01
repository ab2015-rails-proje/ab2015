class Admin::TeachersController < Admin::BaseController
	def index
		@search = Teacher.ransack(params[:q])
    	@teacher = @search.result.paginate(page: params[:page])
	end

	def blocked
	end

   
end
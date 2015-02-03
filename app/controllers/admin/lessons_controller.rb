class Admin::LessonsController < Admin::BaseController
  before_action :set_Lesson, only: [:show, :edit, :update, :destroy]

  respond_to :html
  add_breadcrumb "Dersler", :admin_lessons_path

  def index
    @search = Lesson.ransack(params[:q])
    @lesson = @search.result.paginate(page: params[:page])
    
  end

  def show
    add_breadcrumb @lesson.name, admin_lesson_path(@lesson)
    respond_with(:admin, @lesson)
  end

  def new
  	@lesson = Lesson.new
  	 respond_with(:admin, @lesson)
  end

  def edit
  end

  def create
    @lesson = Lesson.create(lesson_params)
    @lesson.save
    respond_with(:admin, @lesson)

  end

  def update
    @lesson.update(lesson_params)
    respond_with(:admin,@lesson)
  end

  def destroy
    @lesson.destroy
    respond_with(:admin,@lesson)
  end

  private
    def set_Lesson
      @lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:name, :description)
    end
end

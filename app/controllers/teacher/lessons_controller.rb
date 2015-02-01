class Teacher::LessonsController < Teacher::BaseController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @lessons = Lesson.all
    respond_with(:teacher, @lessons)
  end

  def show
    respond_with(:teacher, @lesson)
  end

  def new
    @lesson = Lesson.new
    respond_with(:teacher, @lesson)
  end

  def edit
  end

  def create
    @lesson = current_teacher.lessons.new(lesson_params)
    @lesson.save
    respond_with(:teacher, @lesson)
  end

  def update
    @lesson.update(lesson_params)
    respond_with(:teacher, @lesson)
  end

  def destroy
    @lesson.destroy
    respond_with(:teacher, @lesson)
  end

  private
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:name, :event_id)
    end
end

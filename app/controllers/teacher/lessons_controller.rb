class Teacher::LessonsController < Teacher::BaseController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Dersler", :teacher_lessons_path
  respond_to :html

  def index
    @lessons = Lesson.all
    respond_with(:teacher, @lessons)
  end

  def show
    add_breadcrumb @lesson.name, teacher_lesson_path(@lesson)
    respond_with(:teacher, @lesson)
  end

  def new
    @lesson = Lesson.new
    respond_with(:teacher, @lesson)
    add_breadcrumb "Yeni Ders", :new_teacher_lesson_path
  end

  def edit
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.save
    @lesson.teachers << current_teacher
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

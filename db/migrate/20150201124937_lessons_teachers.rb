class LessonsTeachers < ActiveRecord::Migration
  def change
    create_table :lessons_teachers, id: false do |t|
      t.integer :lesson_id
      t.integer :teacher_id
    end
    add_index :lessons_teachers, [:lesson_id, :teacher_id], unique: true
  end
end

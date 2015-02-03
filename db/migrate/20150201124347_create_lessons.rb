class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.references :event, index: true

      t.timestamps
    end
  end
end

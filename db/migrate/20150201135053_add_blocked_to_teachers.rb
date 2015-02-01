class AddBlockedToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :blocked, :boolean,default: true
  end
end

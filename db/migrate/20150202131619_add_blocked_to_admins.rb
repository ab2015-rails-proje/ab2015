class AddBlockedToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :blocked, :boolean
  end
end

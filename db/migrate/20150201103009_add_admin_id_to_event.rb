class AddAdminIdToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :admin, index: true

    #add_column :events, :admin_id, :integer
    #add_index :events, :admin_id
  end

end

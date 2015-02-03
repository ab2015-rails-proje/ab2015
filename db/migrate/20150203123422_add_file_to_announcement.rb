class AddFileToAnnouncement < ActiveRecord::Migration
  def change
    add_attachment :announcements, :file
  end
end

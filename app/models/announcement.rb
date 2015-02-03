class Announcement < ActiveRecord::Base
  validates_presence_of :title, :content

  has_attached_file :file, styles: { small: "64x64", med: "100x100", large: "200x200" }
end

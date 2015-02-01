# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#  admin_id   :integer
#

class Event < ActiveRecord::Base
	validates_presence_of :name
  belongs_to :admin
end

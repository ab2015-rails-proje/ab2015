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
  has_many :lessons

  scope :only_this_years, -> {where('start_date > ?', Date.today.beginning_of_year)}

  has_many :memberships, through: :lessons
  has_many :users, through: :memberships


  def self.x
    self.where('start_date > ?', Date.today.beginning_of_year)
  end
end

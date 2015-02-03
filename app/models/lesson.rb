class Lesson < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :teachers
  has_many :memberships
  has_many :users, through: :memberships

  validates_presence_of :name, :description,:event
end
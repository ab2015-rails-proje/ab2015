class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, on: :create

  validates :email, presence: true

  has_and_belongs_to_many :lessons, dependent: :destroy

  def active_for_authentication?
    true
  end
end

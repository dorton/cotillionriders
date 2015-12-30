class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable
  has_many :pickups, dependent: :destroy
  has_many :students, :through => :pickups

  def name
    "#{first_name} #{last_name}"
  end

  before_create :add_students_to_carpool

  def add_students_to_carpool
    if self.carpool?
      self.students << Student.all
    end
  end



end

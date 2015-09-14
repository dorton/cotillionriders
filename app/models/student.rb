class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :pickups
  has_many :users, :through => :pickups

  def full_name
    "#{first_name} #{last_name}"
  end

end

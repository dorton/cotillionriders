class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :pickups
  has_many :users, :through => :pickups

  def name
    "#{first_name} #{last_name}"
  end

  before_create do
    self.pic = Faker::Avatar.image
  end

end

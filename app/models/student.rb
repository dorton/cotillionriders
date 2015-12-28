class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :pickups
  has_many :users, :through => :pickups

  def name
    "#{first_name} #{last_name}"
  end

  before_create do
    self.pic = Faker::Avatar.image
    self.users << User.where(carpool: true)
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      student = find_by_id(row["id"]) || new
      student.save!
    end
  end

end

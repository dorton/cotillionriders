# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

def create_gym
  user = User.new
  user.last_name = 'User'
  user.first_name = 'Gym'
  user.email = 'gym@123.com'
  user.password = '12345678'
  user.gym = 'true'
  user.save!
  user
end

create_gym

# def create_carpool_user
#   user = User.new
#   user.last_name = Faker::Name.last_name
#   user.first_name = Faker::Name.first_name
#   user.email = Faker::Internet.email
#   user.password = '12345678'
#   user.carpool = 'true'
#   user.save!
#   user
# end

def create_default_user
  user = User.new
  user.last_name = 'Pool'
  user.first_name = 'Car'
  user.email = 'carpool@123.com'
  user.password = '12345678'
  user.carpool = 'true'
  user.save!
  user
end

# 3.times do
#   create_carpool_user
# end

create_default_user

# def create_teacher
#   teacher = Teacher.new
#   teacher.name = Faker::Name.last_name
#   teacher.grade = Faker::Number.between(1, 5)
#   teacher.room = Faker::Number.between(100, 250)
#   teacher.save!
#   teacher
# end
#
# 10.times do
#   create_teacher
# end
#
# def create_user
#   user = User.new
#   user.first_name = Faker::Name.first_name
#   user.last_name = Faker::Name.last_name
#   user.phone = Faker::PhoneNumber.cell_phone
#   user.email = Faker::Internet.email
#   user.password = Faker::Internet.password
#   user.save!
#   user
# end
#
# def create_student(teacher)
#   student = Student.new
#   student.first_name = Faker::Name.first_name
#   student.last_name = Faker::Name.last_name
#   student.pic = Faker::Avatar.image
#   student.teacher = teacher
#   student.save!
#   student
# end
#
# 30.times do
#   dad  = create_user
#   mom  = create_user
#   [1, 2, 3, 4].sample.times do
#     little_bobby = create_student(Teacher.all.sample)
#     little_bobby.users << dad
#     little_bobby.users << mom
#   end
# end

def create_admin
  user = User.new
  user.last_name = 'Dorton'
  user.first_name = 'Brian'
  user.email = 'brian.dorton@theironyard.com'
  user.password = '12345678'
  user.admin = 'true'
  user.save!
  user
end

# def create_parent
#   user = User.new
#   user.last_name = 'Dorton'
#   user.first_name = 'Kristen'
#   user.email = '123@123.com'
#   user.password = '12345678'
#   user.admin = 'true'
#   user.save!
#   user
# end

dad = create_admin

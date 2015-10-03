# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :current_pickup_sample do
  rand(1..50).times do
    s = Pickup.all.sample
    s.update_attribute :current_pickup, true
  end
end

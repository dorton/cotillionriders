task :current_pickup_sample => :environment do
  rand(1..50).times do
    s = Pickup.all.sample
    s.update_attribute :current_pickup, true
  end
end

json.pickups @adjusts do |pickup|
  json.id pickup.id
  json.student_name pickup.student.name
  json.pic pickup.student.pic
  json.pickup pickup.current_pickup
end

json.parents @users do |user|
  json.id user.id
  json.email user.email
  json.first_name user.first_name
  json.last_name user.last_name
  json.students user.students do |student|
    json.id student.id
    json.last_name student.last_name
    json.first_name student.first_name
  end
end

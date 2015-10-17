json.parent do
  json.id @user.id
  json.name @user.name
  json.students @user.students do |student|
    json.id student.id
    json.last_name student.last_name
    json.first_name student.first_name
  end
end

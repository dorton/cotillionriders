json.array!(@users) do |user|
  json.extract! user, :id, :last_name, :first_name, :admin, :email, :god_mode, :phone
  json.url user_url(user, format: :json)
end

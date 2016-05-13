json.array!(@users) do |user|
  json.extract! user, :id, :title, :first_name, :last_name, :email, :phone, :mobile, :admin, :password_hash, :password_salt, :created_at, :updated_at
  json.url user_url(user, format: :json)
end

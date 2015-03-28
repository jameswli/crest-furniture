json.users @users do |user|
  json.(user, :name, :email, :role)
end
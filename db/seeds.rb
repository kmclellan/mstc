User.create!(firstname:  "William",
             lastname: "Bland",
             email: "admin@email.com",
             password:              "12345678",
             password_confirmation: "12345678")

50.times do |n|
  firstname  = Faker::Name.first_name
  lastname  = Faker::Name.last_name
  email = "basic.user.#{n+1}@email.com"
  password = "12345678"
  User.create!(firstname:  firstname,
               lastname: lastname,
               email: email,
               password:              password,
               password_confirmation: password)
end

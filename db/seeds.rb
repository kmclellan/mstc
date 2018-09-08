# frozen_string_literal: true

User.create!(firstname:  'William',
             lastname: 'Bland',
             email: 'admin@email.com',
             password:              '12345678',
             password_confirmation: '12345678',
             administrator: true,
             activated: true,
             activated_at: Time.zone.now)

Admin.create!(position: 'System Administrator',
              user_id: 1)

50.times do |n|
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  email = "basic.user.#{n + 1}@email.com"
  password = '12345678'
  Faker::Address.full_address
  User.create!(firstname:  firstname,
               lastname: lastname,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

50.times do |n|
  title = "Object #{n + 1}"
  description = Faker::Lorem.sentence(5)
  hourly_rate = Faker::Number.decimal(2)
  Resource.create!(title:  title,
                   description: description,
                   hourly_rate: hourly_rate)
end
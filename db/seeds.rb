# frozen_string_literal: true

utype = %w[admin therapist volunteer client]
utype.each do |t|
  Usertype.create!(user_type: t)
end

User.create!(firstname:  'William',
             lastname: 'Bland',
             usertype_id: 1,
             email: 'admin@email.com',
             password:              '12345678',
             password_confirmation: '12345678',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

50.times do |n|
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  email = "basic.user.#{n + 1}@email.com"
  password = '12345678'
  User.create!(firstname:  firstname,
               lastname: lastname,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

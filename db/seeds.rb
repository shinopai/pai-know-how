99.times do
  res = User.create!(
    email: Faker::Internet.email,
    password: 'password'
  )

  user_profile = res.build_user_profile
  user_profile.save!
end

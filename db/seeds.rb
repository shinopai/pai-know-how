# 99.times do
#   res = User.create!(
#     email: Faker::Internet.email,
#     password: 'password'
#   )

#   user_profile = res.build_user_profile
#   user_profile.save!
# end

# 350.times do
#   Knowhow.create!(
#     title: Faker::Address.country,
#     content: Faker::Lorem.sentence,
#     user_id: User.find(rand(1..User.count)).id,
#     category_id: Category.find(rand(1..Category.count)).id
#   )
# end

UserProfile.count.times do |i|
  id = i + 1

  user_profile = UserProfile.where(user_id: id).first
  user_profile.update!(
    name: Faker::Name.first_name
  )
end

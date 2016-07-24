Item.destroy_all

2.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password,
  confirmed_at: Time.now
  )
end
users = User.all

5.times do
  Item.create!(
  user: users.sample,
  name: Faker::Lorem.sentence
  )
end

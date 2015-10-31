# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do 
    User.create(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, password_digest: "password", about_me: Faker::Lorem.paragraph, avatar: Faker::Avatar.image)
end 


user_1 = User.all[0]
user_2 = User.all[1]
user_3 = User.all[2]
user_4 = User.all[3]

user_1.friendships.create(friend: user_2)

user_1.inverse_friendships.create(user: user_3)



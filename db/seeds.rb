
#users

10.times do
    User.create(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, password: "password", about_me: Faker::Lorem.paragraph, avatar: Faker::Avatar.image)
end

#friendships

user_1 = User.all[0]
user_2 = User.all[1]
user_3 = User.all[2]
user_4 = User.all[3]

user_1.friendships.create(friend: user_2)

user_1.inverse_friendships.create(user: user_3)



#public challenge

public_challenge_1 = Challenge.create(private: false)
user_1.videos.create(title: Faker::Name.title, data_content: Faker::Avatar.image, challenge: public_challenge_1 )
user_2.videos.create(title: Faker::Name.title, data_content: Faker::Avatar.image, challenge: public_challenge_1 )
public_challenge_1.update_attributes(activated_at: Time.now)

#direct_challenge

direct_challenge_1 = Challenge.create(private: false)
user_1.videos.create(title: Faker::Name.title, data_content: Faker::Avatar.image, challenge: direct_challenge_1 )
DirectChallenge.create(challenge: direct_challenge_1, opponent: user_3)
user_3.videos.create(title: Faker::Name.title, data_content: Faker::Avatar.image, challenge: direct_challenge_1)
direct_challenge_1.update_attributes(activated_at: Time.now)





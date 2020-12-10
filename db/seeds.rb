# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Profile.destroy_all
Message.destroy_all

puts "Password: #{password = SecureRandom.hex}"
users = {
  jade: User.new(email: 'jadelynn@masker.family', password: password, uid: SecureRandom.hex, provider: 'none'),
  mr_x: User.new(email: 'x@x.com', password: password, uid: SecureRandom.hex, provider: 'none'),
  mrs_x: User.new(email: 'x2@x.com', password: password, uid: SecureRandom.hex, provider: 'none'),
  joey: User.new(email: 'funny@me.com', password: password, uid: SecureRandom.hex, provider: 'none'),
  betsy: User.new(email: 'betsy@me.com', password: password, uid: SecureRandom.hex, provider: 'none')
}

users.each do |label, user|
  puts "#{label} failed to save user" unless user.save && user.update(uid: user.id)
end

users[:jade].profile = Profile.new(
  nickname: 'Jade',
  first_name: 'Jade',
  middle_name: 'Lynn',
  last_name: 'Masker',
  bio: 'Student at Flatiron School for Software Engineering',
  likes: 'Pizza, friends, and code',
  dislikes: 'bad attitudes',
  age: 21
)

users[:mr_x].profile = Profile.new(
  nickname: 'Mr. X'
)

users[:mrs_x].profile = Profile.new(
  nickname: 'Mrs. X'
)

users[:joey].profile = Profile.new(
  nickname: 'Joey',
  first_name: 'Jackson',
  middle_name: 'Brian',
  last_name: 'Jenkles',
  bio: 'Guy looking for girl, lives in New York',
  likes: 'Football, helping others, chicken wings',
  dislikes: 'Geeks',
  age: 18
)

users[:betsy].profile = Profile.new(
  nickname: 'Betsy',
  bio: 'Girl looking for guy to play computer games with'
)

users.each do |label, user|
  puts "#{label} failed to save profile" unless user.profile.save
end

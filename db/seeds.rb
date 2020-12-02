# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Message.destroy_all

password = 'Jlm12345'

sender = User.create(nickname: 'Sender', email: 'sender@gmail.com', password: password)
receiver = User.create(nickname: 'Receiver', email: 'reciever@gmail.com', password: password)
User.create(nickname: 'Jade', email: 'jadelynn@masker.family', password: password)

Message.create(body: 'Hello', sender: sender, receiver: receiver)
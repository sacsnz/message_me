# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.create(body: "Hi all, I'm in the MessageMe app", user: User.find(2))
Message.create(body: "Hi, I'm using it too!", user: User.find(3))
Message.create(body: "What's the MessageMe app all about?", user: User.find(4))
Message.create(body: "It's just Isaac learning how to code in Ruby on Rails", user: User.find(5))
Message.create(body: "Cool :)", user: User.find(4))
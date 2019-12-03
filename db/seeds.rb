# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
application_1 = Application.find_by(name: "Application 1")
if(!application_1)
  application_1 = Application.create!(name:  "Application 1")
  application_1.create_token
end

if(!application_1.chats.any?)
	application_1.chats.create!(number: 1)
end

chat_1 = application_1.chats.first


if (chat_1.messages.count < 100)
  99.times do |n|
    content  = Faker::Lorem.paragraph
    chat_1.messages.create!(content:  content,
    	msg_number: n)
  end
end

chat_1.messages.create!(content: "Hello world. This is the message I look for", msg_number: 100)



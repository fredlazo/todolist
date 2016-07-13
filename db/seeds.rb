# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

#Create users
5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 'password',
  )
  user.skip_confirmation!
  user.save
end
users = User.all

50.times do
  item = Item.create(
    user: users.sample,
    name: Faker::Lorem.sentence,
  )
end
items = Item.all

memb1 = User.new(
  email: 'fredlazo@yahoo.com',
  password: 'password',
)
memb1.skip_confirmation!
memb1.save

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} posts created"

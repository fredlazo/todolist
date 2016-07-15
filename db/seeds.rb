require 'faker'

# Create some users
10.times do
	user = User.new(
		email:		Faker::Internet.email,
		password:	Faker::Lorem.characters(10)
	)
	user.skip_confirmation!
	user.save!
end
users = User.all

75.times do
	Item.create!(
		user:	users.sample,
		name:	Faker::Lorem.sentence,
		created_at:	Faker::Date.backward(9)
	)
end
items = Item.all

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
	email: 'fredlazo@yahoo.com',
	password: 'password'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"

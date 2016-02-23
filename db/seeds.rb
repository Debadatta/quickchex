# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)1.upto\
1.upto(200) do |i|
	Contact.create({name: Faker::Name.name, phone: Faker::PhoneNumber.phone_number })
	end
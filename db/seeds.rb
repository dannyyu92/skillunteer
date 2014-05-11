# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


charities = ([{:id => 0, :name => 'Animal shelter', :link => 'animals.com', :mission => 'saving the baby animals', :zipcode => '13903'}, {:name => 'Horse petting', :link => 'horses.com', :mission => 'Help the animals', :zipcode => '13902'}, {:name => 'Animal hospital', :link => 'animalhospital.com', :mission => 'Hospital for animlas', :zipcode => '13905'}, {:name => 'Soup Kitchen', :link => 'foodforgood.com', :mission => 'feed the hungry', :zipcode => '10002'}])

charities.each do |charity|
	puts charity
  Charity.create!(charity)
end


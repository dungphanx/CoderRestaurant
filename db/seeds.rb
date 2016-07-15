# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.delete_all
Order.delete_all
FoodItem.delete_all

Foods = [
	'xoi man', 'Xoi ga', 'Xoi dau phong', 'com ga', 'com tam', 'nem chua', 'nuoc mia', 'nuoc cam', 'nha dam duong phen', 'banh cuon', 
	'banh canh', 'bun dau mam tom', 'thit cho', 'my y', 'oc len xao dua', 'mi xao', 'nui xao', 'trai cay dam', 'chao ech', 'chao vit',
	'pho cuon', 'banh kem', 'com tam'
]

breakfast = 'Breakfast'
lunch = 'Lunch'
dinner = 'Dinner'
drinks = 'Drinks'

section = ''

Foods.each.with_index do |value, index|
	if index < 5
		section = breakfast
	elsif index < 10
		section = lunch
	elsif index < 15
		section = dinner
	else
		section = drinks
	end

	FoodItem.create(	name: value,
						description: Faker::Lorem.paragraph(5),
						price: Faker::Commerce.price,
						section: section,
						remote_image_url: '',
						view_count: rand(1..99)
						)

	FoodItem.all.each do |fi|
		rand(1..5).times do
			fi.comments.create! title: Faker::Name.title, body: Faker::Lorem.paragraph(1), rate: rand(1..5)
		end
	end
end		
		
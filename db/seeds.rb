10000.times do
	Person.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		notes: Faker::Lorem.paragraph
	)
end 
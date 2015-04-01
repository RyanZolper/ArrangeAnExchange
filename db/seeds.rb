# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
30.times do
  @fam = Family.create(city: Faker::Address.city, country: Faker::Address.country, tagline: Faker::Company.bs, housepic: Faker::Company.logo, age_range: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20])
  @fam.travelers.create(destinations: ["United States", Faker::Address.country, Faker::Address.country])
end

User.create(name: 'Ryan Zolper', email: 'zolper11@gmail.com', password: 'pwd', password_confirmation: 'pwd')

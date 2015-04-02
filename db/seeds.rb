# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@f = Family.create(city: Faker::Address.city, country: Faker::Address.country, tagline: Faker::Company.bs, housepic: Faker::Company.logo, morepics: [Faker::Company.logo, Faker::Company.logo, Faker::Company.logo, Faker::Company.logo, Faker::Company.logo], age_range: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20])
@f.users.create(name: 'Ryan Zolper', email: 'zolper11@gmail.com', password: 'pwd', password_confirmation: 'pwd', country: "Portugal")

30.times do
  @fam = Family.create(city: Faker::Address.city, country: Faker::Address.country, tagline: Faker::Company.bs, housepic: Faker::Company.logo, morepics: [Faker::Company.logo, Faker::Company.logo, Faker::Company.logo, Faker::Company.logo, Faker::Company.logo], age_range: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20])
  @fam.users.create(name: Faker::Name.name, email:Faker::Internet.email, password: 'password123', password_confirmation: 'password123', country: Faker::Address.country)
  @fam.travelers.create(destinations: ["United States", Faker::Address.country, Faker::Address.country], age: Faker::Number.number(2), pic: Faker::Company.logo, tagline: Faker::Company.bs)
end

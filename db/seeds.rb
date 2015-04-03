# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@f = Family.create do |f|
  f.city = Faker::Address.city
  f.country = Faker::Address.country
  f.tagline = Faker::Company.bs
  f.remote_housepic_url = Faker::Company.logo
  f.age_range = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  f.bio = Faker::Lorem.paragraph
  f.lifehere = Faker::Lorem.paragraph
  f.features = ["pool", "big yard", "hot tub", "beautiful view", "on the water"]
  f.pvtbed = true
  f.pvtbath = false
  f.baths = Faker::Number.digit
  f.beds = Faker::Number.digit
  f.smokers = false
  f.address = Faker::Address.street_address
  f.size = Faker::Number.digit
  f.env = "Suburban"

end

5.times do

@f.fam_attachments.create(remote_image_url: Faker::Company.logo)

end

@z = @f.users.create(name: 'Ryan Zolper', email: 'zolper11@gmail.com', password: 'pwd', password_confirmation: 'pwd', country: "Portugal")

2.times do
  @f.travelers.create(destinations: ["United States", Faker::Address.country, Faker::Address.country], age: Faker::Number.number(2), remote_pic_url: Faker::Company.logo, tagline: Faker::Company.bs, user_id: @z.id, bio: Faker::Lorem.paragraph)
end

30.times do
  @fam = Family.create do |f|
    f.city = Faker::Address.city
    f.country = Faker::Address.country
    f.tagline = Faker::Company.bs
    f.remote_housepic_url = Faker::Company.logo
    f.age_range = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    f.bio = Faker::Lorem.paragraph
    f.lifehere = Faker::Lorem.paragraph
    f.features = ["pool", "big yard", "hot tub"]
    f.pvtbed = true
    f.pvtbath = false
    f.baths = Faker::Number.digit
    f.beds = Faker::Number.digit
    f.smokers = false
    f.address = Faker::Address.street_address
    f.size = Faker::Number.digit
    f.env = "Suburban"
  end

  5.times do

  @fam.fam_attachments.create(remote_image_url: Faker::Company.logo)

  end

  @u = @fam.users.create(name: Faker::Name.name, email:Faker::Internet.email, password: 'password123', password_confirmation: 'password123', country: Faker::Address.country)
  @fam.travelers.create do |t|
    t.destinations = ["United States", Faker::Address.country, Faker::Address.country]
    t.age = Faker::Number.number(2)
    t.remote_pic_url = Faker::Company.logo
    t.tagline = Faker::Company.bs
    t.user_id = @u.id
    t.bio = Faker::Lorem.paragraph
  end
end

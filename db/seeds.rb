# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@f = Family.create do |f|
  f.city = Faker::Address.city
  @c = f.country = Faker::Address.country
  f.tagline = "Come stay with us in #{@c} and live the high life"
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

4.times do
  @fam = Family.create do |f|
    f.city = Faker::Address.city
    @c = f.country = "France"
    f.tagline = "Come stay with us in #{@c} and live the high life"
    f.remote_housepic_url = "http://suburbanfinance.com/wp-content/uploads/2013/04/streetinfo.jpg"
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


  @fam.fam_attachments.create(remote_image_url: "http://www.smple.co/wp-content/uploads/2015/03/inside-house-pictures-imspirational-ideas-2-on-house-design-ideas.jpg")
  @fam.fam_attachments.create(remote_image_url: "http://www.smple.co/wp-content/uploads/2015/03/pool-inside-house-inspired-design-1-on-house-design-ideas.jpg")
  @fam.fam_attachments.create(remote_image_url: "http://www.mflandscapeanddesign.com/wp-content/uploads/2013/10/dream-backyard.jpg")
  @fam.fam_attachments.create(remote_image_url: "http://www.smple.co/wp-content/uploads/2015/03/bedroom-pictures-awesome-decoration-9-on-bedroom-design-ideas.jpg")
  @fam.fam_attachments.create(remote_image_url: "http://uglyhousephotos.com/wordpress/wp-content/uploads/2013/03/130317trentonnj5.jpg")


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




30.times do
  @fam = Family.create do |f|
    f.city = Faker::Address.city
    @c = f.country = Faker::Address.country
    f.tagline = "Come stay with us in #{@c} and live the high life"
    f.remote_housepic_url = "http://suburbanfinance.com/wp-content/uploads/2013/04/streetinfo.jpg"
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


  @fam.fam_attachments.create(remote_image_url: "http://www.smple.co/wp-content/uploads/2015/03/inside-house-pictures-imspirational-ideas-2-on-house-design-ideas.jpg")
  @fam.fam_attachments.create(remote_image_url: "http://www.smple.co/wp-content/uploads/2015/03/pool-inside-house-inspired-design-1-on-house-design-ideas.jpg")
  @fam.fam_attachments.create(remote_image_url: "http://www.mflandscapeanddesign.com/wp-content/uploads/2013/10/dream-backyard.jpg")
  @fam.fam_attachments.create(remote_image_url: "http://www.smple.co/wp-content/uploads/2015/03/bedroom-pictures-awesome-decoration-9-on-bedroom-design-ideas.jpg")
  @fam.fam_attachments.create(remote_image_url: "http://uglyhousephotos.com/wordpress/wp-content/uploads/2013/03/130317trentonnj5.jpg")


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

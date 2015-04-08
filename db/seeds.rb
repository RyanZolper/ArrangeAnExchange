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
  f.housepic = Rails.root.join("app/assets/images/seed0.jpg").open
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

@f.fam_attachments.create(image: Rails.root.join("app/assets/images/inseed1.jpg").open)
@f.fam_attachments.create(image: Rails.root.join("app/assets/images/inseed2.jpg").open)
@f.fam_attachments.create(image: Rails.root.join("app/assets/images/inseed3.jpg").open)
@f.fam_attachments.create(image: Rails.root.join("app/assets/images/inseed4.jpg").open)
@f.fam_attachments.create(image: Rails.root.join("app/assets/images/inseed5.jpg").open)


@z = @f.users.create(name: 'Ryan Zolper', email: 'zolper11@gmail.com', password: 'pwd', password_confirmation: 'pwd', country: "Portugal")

@z1 = @f.travelers.create(destinations: ["United States", Faker::Address.country, Faker::Address.country], age: Faker::Number.number(2), pic: Rails.root.join("app/assets/images/kid1.jpg").open, tagline: Faker::Company.bs, user_id: @z.id, bio: Faker::Lorem.paragraph)
@z2 = @f.travelers.create(destinations: ["United States", Faker::Address.country, Faker::Address.country], age: Faker::Number.number(2), pic: Rails.root.join("app/assets/images/kid2.jpg").open, tagline: Faker::Company.bs, user_id: @z.id, bio: Faker::Lorem.paragraph)


4.times do
  @num = Faker::Number.digit
  @fam = Family.create do |f|
    f.city = Faker::Address.city
    @c = f.country = "France"
    f.tagline = "Come stay with us in #{@c} and live the high life"
    f.housepic = Rails.root.join("app/assets/images/seed#{@num}.jpg").open
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

  @fam.hosteds << @z1
  @fam.hosteds << @z2

  @fam.connections.first.update("hostreview" => "What a wonderful family! Would love to visit again! Beautiful home too!", "travreview" => "Great kid :)", "hoststars" => "5", "travstars" => "5")
  @fam.connections.second.update("hostreview" => "Wish that this was my real family... awesome yard and an even better atmosphere for happiness!", "travreview" => "Great kid :)", "hoststars" => "4", "travstars" => "5")


  @fam.fam_attachments.create(image: Rails.root.join("app/assets/images/inseed1.jpg").open)
  @fam.fam_attachments.create(image: Rails.root.join("app/assets/images/inseed2.jpg").open)
  @fam.fam_attachments.create(image: Rails.root.join("app/assets/images/inseed3.jpg").open)
  @fam.fam_attachments.create(image: Rails.root.join("app/assets/images/inseed4.jpg").open)
  @fam.fam_attachments.create(image: Rails.root.join("app/assets/images/inseed5.jpg").open)


  @u = @fam.users.create(name: Faker::Name.name, email:Faker::Internet.email, password: 'password123', password_confirmation: 'password123', country: Faker::Address.country)
  @fam.travelers.create do |t|
    t.destinations = ["United States", Faker::Address.country, Faker::Address.country]
    t.age = Faker::Number.number(2)
    t.pic = Rails.root.join("app/assets/images/kid3.jpg").open
    t.tagline = Faker::Company.bs
    t.user_id = @u.id
    t.bio = Faker::Lorem.paragraph
  end
end




30.times do
  @num = Faker::Number.digit
  @fam = Family.create do |f|
    f.city = Faker::Address.city
    @c = f.country = Faker::Address.country
    f.tagline = "Come stay with us in #{@c} and live the high life"
    f.housepic = Rails.root.join("app/assets/images/seed#{@num}.jpg").open
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

  @fam.hosteds << @z1
  @fam.hosteds << @z2

  @fam.connections.first.update("hostreview" => "What a wonderful family! Would love to visit again! Beautiful home too!", "travreview" => "Great kid :)", "hoststars" => "5", "travstars" => "5")
  @fam.connections.second.update("hostreview" => "Wish that this was my real family... awesome yard and an even better atmosphere for happiness!", "travreview" => "Great kid :)", "hoststars" => "4", "travstars" => "5")

  @fam.save

  @fam.fam_attachments.create(image: Rails.root.join("app/assets/images/inseed1.jpg").open)
  @fam.fam_attachments.create(image: Rails.root.join("app/assets/images/inseed2.jpg").open)
  @fam.fam_attachments.create(image: Rails.root.join("app/assets/images/inseed3.jpg").open)
  @fam.fam_attachments.create(image: Rails.root.join("app/assets/images/inseed4.jpg").open)
  @fam.fam_attachments.create(image: Rails.root.join("app/assets/images/inseed5.jpg").open)


  @u = @fam.users.create(name: Faker::Name.name, email:Faker::Internet.email, password: 'password123', password_confirmation: 'password123', country: Faker::Address.country)
  @fam.travelers.create do |t|
    t.destinations = ["United States", Faker::Address.country, Faker::Address.country]
    t.age = Faker::Number.number(2)
    t.pic = Rails.root.join("app/assets/images/kid4.jpg").open
    t.tagline = Faker::Company.bs
    t.user_id = @u.id
    t.bio = Faker::Lorem.paragraph
  end
end

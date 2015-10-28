# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)
@rates = [3.5, 3.75, 4, 4.25, 4.5, 4.75, 5]

@f = Family.create do |f|
  f.city = "St. Petersburg, FL"
  f.country = "United States"
  f.tagline = "Come fish and soak up the sun in beautiful St. Pete!"
  f.remote_housepic_url = "https://s3.amazonaws.com/tiybucket/myhouse/20150411_113742.jpg"
  f.age_range = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  f.bio = "We are a family of soccer players and animal lovers. We already have seven members, what's one more?"
  f.lifehere = "Life in St. Pete is relaxing and rewarding. The neighbors are friendly and the community is very supportive. If you don't say 'howdy!' when you pass it's clear you aren't from around here!"
  f.features = ["pool", "hot tub", "ryan lives here", "dogs", "cats"]
  f.attracts = "St Pete has great fishing. The water is warm and the beaches are beautiful. Downtown has many cool resteraunts and bars. Did I talk about the fishing? Awesome fishing."
  f.pvtbed = false
  f.pvtbath = false
  f.baths = 4
  f.beds = 4
  f.smokers = false
  f.address = Faker::Address.street_address
  f.size = 7
  f.env = "Suburban"

end



@f.fam_attachments.create(remote_image_url: "https://s3.amazonaws.com/tiybucket/myhouse/20150411_113815.jpg")
@f.fam_attachments.create(remote_image_url: "https://s3.amazonaws.com/tiybucket/myhouse/20150411_113827.jpg")
@f.fam_attachments.create(remote_image_url: "https://s3.amazonaws.com/tiybucket/myhouse/20150411_113854.jpg")
@f.fam_attachments.create(remote_image_url: "https://s3.amazonaws.com/tiybucket/myhouse/20150411_113949.jpg")

@z = @f.users.create(name: "Ryan Zolper", email: "zolper11@gmail.com", admin: true, password: "pwd", password_confirmation: "pwd", country: "Portugal")
@f.users.create(name: "Phillip R. Demo", email: "demo@AAE.com", admin: false, password: "password", password_confirmation: "password", country: "Portugal")

@f.travelers.create(destinations: ["United States", Faker::Address.country, Faker::Address.country], age: 20, name: "Ryan", remote_pic_url: "https://s3.amazonaws.com/tiybucket/myhouse/10556324_10203263270764015_3641761369509833284_n.jpg", tagline: "Making me breakfast: $3.
Getting to know me: priceless!", user_id: @z.id, bio: "I'm a junior level Rails programmer and a persistent fisherman with a consistent lack of caught fish. I would love to travel to Germany, Italy, Spain, Mexico or Alaska.")
@z1 = @f.travelers.create(destinations: ["United States", Faker::Address.country, Faker::Address.country], age: 18, name: "Sarah", remote_pic_url: "https://s3.amazonaws.com/tiybucket/myhouse/252209_10151468806866309_1606142347_n.png", tagline: "The world is my oyster, I won't stop until I find the pearl!", user_id: @z.id, bio: "I'm a college student with aspirations of presidency and dreams of a utopian land. I'll travel anywhere (As long as it's warm...)!")
@z2 = @f.travelers.create(destinations: ["United States", Faker::Address.country, Faker::Address.country], age: 18, name: "Bobby", remote_pic_url: "https://s3.amazonaws.com/tiybucket/myhouse/10857974_946984665330890_5968634382504342058_n.jpg", tagline: "Next stop, the Vatican!", user_id: @z.id, bio: "Things I like: soccer, TFM, saying 'brah', chirpin', and chirpin'")



#france0

@fam = Family.create do |f|
  f.city = "Bordeaux"
  @c = f.country = "France"
  f.tagline = "There are no outsiders if you stay in our home, only family."
  f.remote_housepic_url = "http://www.premierfrenchproperty.com/files/property_images/IMG_7634_0.jpg"
  f.age_range = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  f.bio = "We are a happy family of four. We have nightly family suppers and make fresh omelettes every morning! Some things we like to do as a family are horseback riding, wine tastings and trips to Champagne country. We would love to host a kind teenager that would fit into our laid-back family dynamic and treat him or her like our own."
  f.lifehere = "Life in Bordeaux is relaxing and rewarding. The neighbors are friendly and the community is very supportive. If you don't say 'bonjour!' when you pass it's clear you aren't from around here!"
  f.features = ["sunsets", "big yard", "hot tub"]
  f.attracts = "Bordeaux doesn't have many 'attractions', so to speak. We enjoy the simple things here."
  f.pvtbed = true
  f.pvtbath = false
  f.baths = 3
  f.beds = 4
  f.smokers = false
  f.address = Faker::Address.street_address
  f.size = 4
  f.env = "Suburban"
end

@fam.hosteds << @z1
@fam.hosteds << @z2

@fam.connections.first.update("hostreview" => "What a wonderful family, would love to visit again! Beautiful home too!", "travreview" => "Great kid :)", "hoststars" => "#{@rates.sample}", "travstars" => "#{@rates.sample}")
@fam.connections.second.update("hostreview" => "Wish that this was my home... awesome yard and an even better atmosphere for happiness!", "travreview" => "Great kid :)", "hoststars" => "#{@rates.sample}", "travstars" => "#{@rates.sample}")


@in1 = @fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_2.jpg")
@in2 = @fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_3.jpg")
@in3 = @fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_5.jpg")
@in4 = @fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_9.jpg")
@in5 = @fam.fam_attachments.create(remote_image_url: "http://www.decosee.com/picture/best-design-simple-attic-bedroom.jpg")

@u = @fam.users.create(name: Faker::Name.name, email:Faker::Internet.email, password: "password123", password_confirmation: "password123", country: Faker::Address.country)
@fam.travelers.create do |t|
  t.destinations = ["United States", Faker::Address.country, Faker::Address.country]
  t.age = 16
  t.remote_pic_url = "http://www.chinadaily.com.cn/photo/images/attachement/jpg/site1/20130106/0023ae9885da12531c4508.jpg"
  t.tagline = "I want to travel to America and explore the second best country in the world :)"
  t.user_id = @u.id
  t.bio = "I am in my last year of secondary, and I want to travel to the USA before I start university. I will be studying environmental science at Ecole Normale Supérieure in Paris and I hope I can explore the world a little bit before I buckle down and do my best to save it!"
end

#france1

@num = Faker::Number.digit
@fam = Family.create do |f|
  f.city = "Saint-Denis"
  @c = f.country = "France"
  f.tagline = "Ride horses and drink wine on our beautiful 5 acre land!"
  f.remote_housepic_url = "http://pics.green-acres.com/31895a/pics/31895a-213-VI_1.jpg"
  f.age_range = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  f.bio = "We are a happy family of six. We have nightly family suppers and make fresh omelettes every morning! Some things we like to do as a family are horseback riding, wine tastings and trips to Champagne country. We would love to host a kind teenager that would fit into our laid-back family dynamic and treat him or her like our own."
  f.lifehere = "Life in Saint-Denis is relaxing and rewarding. The neighbors are friendly and the community is very supportive. If you don't say 'bonjour!' when you pass it's clear you aren't from around here!"
  f.features = ["pool", "big yard", "sunsets", "horses"]
  f.attracts = "Saint-Denis doesn't have many 'attractions', so to speak. We enjoy the simple things here."
  f.pvtbed = true
  f.pvtbath = false
  f.baths = 7
  f.beds = 5
  f.smokers = false
  f.address = Faker::Address.street_address
  f.size = 6
  f.env = "Suburban"
end

@fam.hosteds << @z1
@fam.hosteds << @z2

@fam.connections.first.update("hostreview" => "What a wonderful family, would love to visit again! Beautiful home too!", "travreview" => "Great kid :)", "hoststars" => "#{@rates.sample}", "travstars" => "#{@rates.sample}")
@fam.connections.second.update("hostreview" => "Wish that this was my home... awesome yard and an even better atmosphere for happiness!", "travreview" => "Great kid :)", "hoststars" => "#{@rates.sample}", "travstars" => "#{@rates.sample}")


@fam.fam_attachments << @in1
@fam.fam_attachments << @in2
@fam.fam_attachments << @in3
@fam.fam_attachments << @in4
@fam.fam_attachments << @in5


@u = @fam.users.create(name: Faker::Name.name, email:Faker::Internet.email, password: "password123", password_confirmation: "password123", country: Faker::Address.country)
@fam.travelers.create do |t|
  t.destinations = ["United States", Faker::Address.country, Faker::Address.country]
  t.age = Faker::Number.number(2)
  t.remote_pic_url = "http://www.chinadaily.com.cn/photo/images/attachement/jpg/site1/20130106/0023ae9885da12531c4508.jpg"
  t.tagline = Faker::Company.bs
  t.user_id = @u.id
  t.bio = Faker::Lorem.paragraph
end

#france2

@num = Faker::Number.digit
@fam = Family.create do |f|
  f.city = "Orléans"
  @c = f.country = "France"
  f.tagline = "Stay with us in the lovely town of Orléans and live the high life!"
  f.remote_housepic_url = "http://pics.green-acres.com/31882a/pics/31882a-10296_1.jpg"
  f.age_range = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  f.bio = "We are a happy family of five. We have nightly family suppers and make fresh omelettes every morning! Some things we like to do as a family are horseback riding, wine tastings and trips to Champagne country. We would love to host a kind teenager that would fit into our laid-back family dynamic and treat him or her like our own."
  f.lifehere = "Life in Orléans is relaxing and rewarding. The neighbors are friendly and the community is very supportive. If you don't say 'bonjour!' when you pass it's clear you aren't from around here!"
  f.features = ["pool", "big yard", "hot tub"]
  f.attracts = "Orléans doesn't have many 'attractions', so to speak. We enjoy the simple things here."
  f.pvtbed = true
  f.pvtbath = false
  f.baths = 3
  f.beds = 3
  f.smokers = false
  f.address = Faker::Address.street_address
  f.size = 5
  f.env = "Suburban"
end

@fam.hosteds << @z1
@fam.hosteds << @z2

@fam.connections.first.update("hostreview" => "What a wonderful family, would love to visit again! Beautiful home too!", "travreview" => "Great kid :)", "hoststars" => "#{@rates.sample}", "travstars" => "#{@rates.sample}")
@fam.connections.second.update("hostreview" => "Wish that this was my home... awesome yard and an even better atmosphere for happiness!", "travreview" => "Great kid :)", "hoststars" => "#{@rates.sample}", "travstars" => "#{@rates.sample}")


@fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_2.jpg")
@fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_3.jpg")
@fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_5.jpg")
@fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_9.jpg")
@fam.fam_attachments.create(remote_image_url: "http://www.decosee.com/picture/best-design-simple-attic-bedroom.jpg")


@u = @fam.users.create(name: Faker::Name.name, email:Faker::Internet.email, password: "password123", password_confirmation: "password123", country: Faker::Address.country)
@fam.travelers.create do |t|
  t.destinations = ["United States", Faker::Address.country, Faker::Address.country]
  t.age = 16
  t.remote_pic_url = "http://www.chinadaily.com.cn/photo/images/attachement/jpg/site1/20130106/0023ae9885da12531c4508.jpg"
  t.tagline = "I want to travel to America and explore the second best country in the world :)"
  t.user_id = @u.id
  t.bio = "I am in my last year of secondary, and I want to travel to the USA before I start university. I will be studying environmental science at Ecole Normale Supérieure in Paris and I hope I can explore the world a little bit before I buckle down and do my best to save it!"
end

#france3

@num = Faker::Number.digit
@fam = Family.create do |f|
  f.city = "Avignon"
  @c = f.country = "France"
  f.tagline = "Come pick roses and make fresh cheese in Avignon!"
  f.remote_housepic_url = "http://www.infoteli.com/wp-content/uploads/2011/01/Dream-old-house-design-architecture.jpg"
  f.age_range = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  f.bio = "We are a happy family of four. We have nightly family suppers and make fresh omelettes every morning! Some things we like to do as a family are horseback riding, wine tastings and trips to Champagne country. We would love to host a kind teenager that would fit into our laid-back family dynamic and treat him or her like our own."
  f.lifehere = "Life in Bordeaux is relaxing and rewarding. The neighbors are friendly and the community is very supportive. If you don't say 'bonjour!' when you pass it's clear you aren't from around here!"
  f.features = ["pool", "big yard", "hot tub"]
  f.attracts = "Avignon doesn't have many 'attractions', so to speak. We enjoy the simple things here."
  f.pvtbed = true
  f.pvtbath = false
  f.baths = 2
  f.beds = 3
  f.smokers = false
  f.address = Faker::Address.street_address
  f.size = 4
  f.env = "Suburban"
end

@fam.hosteds << @z1
@fam.hosteds << @z2

@fam.connections.first.update("hostreview" => "What a wonderful family, would love to visit again! Beautiful home too!", "travreview" => "Great kid :)", "hoststars" => "#{@rates.sample}", "travstars" => "#{@rates.sample}")
@fam.connections.second.update("hostreview" => "Wish that this was my home... awesome yard and an even better atmosphere for happiness!", "travreview" => "Great kid :)", "hoststars" => "#{@rates.sample}", "travstars" => "#{@rates.sample}")


@fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_2.jpg")
@fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_3.jpg")
@fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_5.jpg")
@fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_9.jpg")
@fam.fam_attachments.create(remote_image_url: "http://www.decosee.com/picture/best-design-simple-attic-bedroom.jpg")


@u = @fam.users.create(name: Faker::Name.name, email:Faker::Internet.email, password: "password123", password_confirmation: "password123", country: Faker::Address.country)
@fam.travelers.create do |t|
  t.destinations = ["United States", Faker::Address.country, Faker::Address.country]
  t.age = 16
  t.remote_pic_url = "http://www.chinadaily.com.cn/photo/images/attachement/jpg/site1/20130106/0023ae9885da12531c4508.jpg"
  t.tagline = "I want to travel to America and explore the second best country in the world :)"
  t.user_id = @u.id
  t.bio = "I am in my last year of secondary, and I want to travel to the USA before I start university. I will be studying environmental science at Ecole Normale Supérieure in Paris and I hope I can explore the world a little bit before I buckle down and do my best to save it!"
end


2.times do

  @beds = [3, 4, 5, 6]
  @cs = ["United Kingdom", "Italy", "Germany", "Japan", "United States", "South Africa", "Argentina", "Portugal"]
  @ct = ["London", "Venice", "Bad Säckingen", "Kasugai", "Honolulu, Hawaii", "Johannesburg", "La Plata", "Alijó"]
  @hs = ["http://i.telegraph.co.uk/multimedia/archive/02280/newcompass21072_2280284k.jpg", "http://j3s.net/italopix/venice_house1.jpg", "https://apcrhodes.files.wordpress.com/2011/07/114_0276.jpg", "http://www.house-design-coffee.com/images/Japan-houses-6-13-hybrid-house.jpg", "http://www.helpurenthawaii.com/aliomanusands_house.jpg", "http://www.trendir.com/house-design/cove-pezula-estate-knysna-saota-house-1.jpg", "http://www.onekindesign.com/wp-content/uploads/2012/07/House-of-Jasmines-01-1-Kind-Design-600x400.jpg", "http://www.perfectportugalproperty.co.uk/wp-content/gallery/609mu/a.jpg"]
  @ts = ["http://www.idigitaltimes.co.uk/data/images/full/2013/03/26/356870-british-teen-becomes-millionaire.jpg", "http://i1.dailyrecord.co.uk/incoming/article876101.ece/ALTERNATES/s615/melissa-bassi-image-2-226956959.jpg", "http://d.ibtimes.co.uk/en/full/323365/donis-avdijaj.jpg", "http://www.tokyofaces.com/wp-content/uploads/2013/03/130322-2b.jpg", "http://40.media.tumblr.com/5e25c690a183e2a7a3c615b7eebed047/tumblr_n97cn42b611r9cpo7o1_500.jpg", "http://www.sapeople.com/wp-content/uploads/2015/02/Screen-Shot-2015-02-26-at-16.28.33-590x433.png", "http://www.globalbeauties.com/blog/wp-content/uploads/2012/11/ARGENTINA-Carmen-Cuneo.jpg", "http://dh.canterbury.ac.nz/the-record/wp-content/uploads/sites/6/2013/09/Joao-Belo_pic.png"]
  @cnt = 0

  8.times do
    @num = Faker::Number.digit
    @fam = Family.create do |f|
      f.city = @ct[@cnt]
      f.country = @cs[@cnt]
      f.tagline = "Stay with us in #{@ct[@cnt]}, #{@cs[@cnt]} and live the high life!"
      f.remote_housepic_url = @hs[@cnt]
      f.age_range = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
      f.bio = Faker::Lorem.paragraph
      f.lifehere = Faker::Lorem.paragraph
      f.attracts = Faker::Lorem.paragraph
      f.features = ["pool", "big yard", "hot tub"]
      f.pvtbed = true
      f.pvtbath = false
      @b = f.beds = @beds.sample
      f.baths = (@b - 1)
      f.smokers = false
      f.address = Faker::Address.street_address
      f.size = (@b + 1)
      f.env = "Suburban"
    end

    @fam.hosteds << @z1
    @fam.hosteds << @z2

    @fam.connections.first.update("hostreview" => "What a wonderful family, would love to visit again! Beautiful home too!", "travreview" => "Great kid :)", "hoststars" => "#{@rates.sample}", "travstars" => "#{@rates.sample}")
    @fam.connections.second.update("hostreview" => "Wish that this was my home... awesome yard and an even better atmosphere for happiness!", "travreview" => "Great kid :)", "hoststars" => "#{@rates.sample}", "travstars" => "#{@rates.sample}")

    @fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_2.jpg")
    @fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_3.jpg")
    @fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_5.jpg")
    @fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_9.jpg")
    @fam.fam_attachments.create(remote_image_url: "http://www.decosee.com/picture/best-design-simple-attic-bedroom.jpg")


    @u = @fam.users.create(name: Faker::Name.name, email:Faker::Internet.email, password: "password123", password_confirmation: "password123", country: Faker::Address.country)
    @fam.travelers.create do |t|
      t.destinations = ["United States", Faker::Address.country, Faker::Address.country]
      t.age = 17
      t.remote_pic_url = @ts[@cnt]
      t.tagline = "Everytime I here the name of your country, I just want to smile and know I've been there!"
      t.user_id = @u.id
      t.bio = Faker::Lorem.paragraph
    end
    @cnt += 1
  end

  @cs = ["United Kingdom", "Italy", "Germany", "Japan", "United States", "South Africa", "Argentina", "Portugal"]
  @ct = ["London", "Lazio", "Bad Säckingen", "Kasugai", "Los Angeles, California", "Johannesburg", "La Bababa", "Jobenjó"]
  @hs = ["http://www.self-build.co.uk/sites/default/files/styles/hp_image/public/family-home-renovation.png?itok=SOq5-vC6", "http://coolshire.com/wp-content/uploads/2013/11/Italian-Farm-House.png", "http://stationedingermany.com/wp-content/uploads/2013/12/DSC01111.jpg", "http://m6.i.pbase.com/g4/81/662581/2/61118636.DSC_15820517.jpg", "http://www.celebritydetective.com/pictures/Dorell-Wright-house-Walnut-Creek-CA-pictures.JPG", "http://www.images.midbrakproperties.com/37994/001_100_0892.jpg", "http://graphics8.nytimes.com/images/2013/05/15/greathomesanddestinations/15-GH-IHH-SPAN/15-GH-IHH-SPAN-articleLarge.jpg", "http://www.imatico.lu/uk/reference/1170/House_VDu1170_1_for%20sale%20in_Coimbra_Central%20Portugal.JPG"]
  @cnt = 0

  8.times do
    @num = Faker::Number.digit
    @fam = Family.create do |f|
      f.city = @ct[@cnt]
      f.country = @cs[@cnt]
      f.tagline = "Stay with us in #{@ct[@cnt]}, #{@cs[@cnt]} and live the high life!"
      f.remote_housepic_url = @hs[@cnt]
      f.age_range = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
      f.bio = Faker::Lorem.paragraph
      f.lifehere = Faker::Lorem.paragraph
      f.attracts = Faker::Lorem.paragraph
      f.features = ["pool", "big yard", "hot tub"]
      f.pvtbed = true
      f.pvtbath = false
      @b = f.beds = @beds.sample
      f.baths = (@b - 1)
      f.smokers = false
      f.address = Faker::Address.street_address
      f.size = (@b + 1)
      f.env = "Suburban"
    end

    @fam.hosteds << @z1
    @fam.hosteds << @z2

    @fam.connections.first.update("hostreview" => "What a wonderful family, would love to visit again! Beautiful home too!", "travreview" => "Great kid :)", "hoststars" => "#{@rates.sample}", "travstars" => "#{@rates.sample}")
    @fam.connections.second.update("hostreview" => "Wish that this was my home... awesome yard and an even better atmosphere for happiness!", "travreview" => "Great kid :)", "hoststars" => "#{@rates.sample}", "travstars" => "#{@rates.sample}")


    @fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_2.jpg")
    @fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_3.jpg")
    @fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_5.jpg")
    @fam.fam_attachments.create(remote_image_url: "http://pics.green-acres.com/31895a/pics/31895a-213-VI_9.jpg")
    @fam.fam_attachments.create(remote_image_url: "http://www.decosee.com/picture/best-design-simple-attic-bedroom.jpg")


    @u = @fam.users.create(name: Faker::Name.name, email:Faker::Internet.email, password: "password123", password_confirmation: "password123", country: Faker::Address.country)
    @fam.travelers.create do |t|
      t.destinations = ["United States", Faker::Address.country, Faker::Address.country]
      t.age = 17
      t.remote_pic_url = @ts[@cnt]
      t.tagline = "Everytime I here the name of your country, I just want to smile and know I've been there!"
      t.user_id = @u.id
      t.bio = Faker::Lorem.paragraph
    end
    @cnt += 1
  end
end

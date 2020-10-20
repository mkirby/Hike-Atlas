require 'json'
require 'rest-client'
require_relative '../.hike_key.rb'

# Trail.delete_all

api_response = RestClient.get("https://www.hikingproject.com/data/get-trails?lat=40.727811&lon=-73.954511&maxDistance=100&maxResults=5&key=#{$hike_key}")

api_data = JSON.parse(api_response)

api_data["trails"].each do |trail|
    Trail.create(
        api_id: trail["id"],
        name: trail["name"],
        summary: trail["summary"],
        difficulty: trail["difficulty"],
        length: trail ["length"],
        stars: trail["stars"],
        location: trail["location"],
        ascent: trail["ascent"],
        high: trail["high"],
        condition_status: trail["conditionStatus"],
        condition_details: trail["conditionDetails"],
        condition_date: trail["conditionDate"],
        img_sq_small: trail["imgSqSmall"],
        img_medium: trail["imgMedium"],
        url: trail["url"]
	)  
end

# results = Geocoder.search("New York, NY")
# results.first.coordinates

10.times do
    Hike.create(trail_id: Trail.all.sample.id, start_date: ["January 8, 2021","January 15, 2021","January 20, 2021"].sample, end_date: ["February 8, 2021","February 15, 2021","February 20, 2021"].sample, note: ["Best Friends Outing Trip", "Hike Away the Blues Trip", "Solo Trip", "Backpacking the great unknown"].sample)
end

10.times do
    name = Faker::FunnyName.unique.name.split(" ")
    first_name = name[0]
    last_name = name [1]
    email = Faker::Internet.email(name: "#{name}", separators: '.')
    pass = Faker::Internet.password
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: email,
        email_confirmation: email,
        password_digest: pass,
        password_digest_confirmation: pass,
        phone: Faker::PhoneNumber.cell_phone,
        e_contact_name: Faker::FunnyName.unique.three_word_name,
        e_contact_email: Faker::Internet.unique.email,
        e_contact_phone: Faker::PhoneNumber.cell_phone
    )
end

@categories = ["Hiking Gear", "Clothing & Footwear", "Food & Water", "Navigation", "Emergency & First Aid", "Health & Hygiene", "Tools & Repair Items", "Day Hiking Extras", "Personal Items"]
@count = 0
10.times do
    Category.create(name: @categories[@count])
    @count += 1
end

50.times do
    Item.create(
        name: Faker::Lorem.word,
        description: Faker::Lorem.paragraph,
        weight: rand(1..12),
        cost: rand(1..150),
        condition: ["New", "Used", "Old", "Bad", "Broken"].sample,
        note: Faker::Movies::PrincessBride.quote,
        url: Faker::Placeholdit.image,
        user_id: User.all.sample.id,
        category_id: Category.all.sample.id
    )
end

10.times do
    UserHike.create(hike_id: Hike.all.sample.id, user_id: User.all.sample.id)
end

50.times do
    HikeItem.create(item_id: Item.all.sample.id, hike_id: Hike.all.sample.id)
end
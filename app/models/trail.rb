require_relative '../../.hike_key.rb'

class Trail < ApplicationRecord
		has_many :hikes

    def self.demo_data#(city, state, max_distance, max_results)
        api_data = {"trails"=>[{"id"=>7019363, "name"=>"Mt. Tammany Summit", "type"=>"Recommended Route", "summary"=>"A fantastic loop with outstanding views of Mt. Minsi, the Delaware River and the surrounding area.", "difficulty"=>"blueBlack", "stars"=>4.6, "starVotes"=>95, "location"=>"Stroudsburg, Pennsylvania", "url"=>"https://www.hikingproject.com/trail/7019363/mt-tammany-summit", "imgSqSmall"=>"https://cdn2.apstatic.com/photos/hike/7029055_sqsmall_1554919813.jpg", "imgSmall"=>"https://cdn2.apstatic.com/photos/hike/7029055_small_1554919813.jpg", "imgSmallMed"=>"https://cdn2.apstatic.com/photos/hike/7029055_smallMed_1554919813.jpg", "imgMedium"=>"https://cdn2.apstatic.com/photos/hike/7029055_medium_1554919813.jpg", "length"=>3.4, "ascent"=>1151, "descent"=>-1182, "high"=>1506, "low"=>323, "longitude"=>-75.1254, "latitude"=>40.9717, "conditionStatus"=>"Minor Issues", "conditionDetails"=>"Some Mud", "conditionDate"=>"2020-10-19 11:47:52"}, {"id"=>7023693, "name"=>"Bear Mountain Loop", "type"=>"Recommended Route", "summary"=>"A moderate loop with some fun rock scrambling and amazing views toward the city.", "difficulty"=>"blueBlack", "stars"=>4.1, "starVotes"=>58, "location"=>"Fort Montgomery, New York", "url"=>"https://www.hikingproject.com/trail/7023693/bear-mountain-loop", "imgSqSmall"=>"https://cdn2.apstatic.com/photos/hike/7047408_sqsmall_1555537010.jpg", "imgSmall"=>"https://cdn2.apstatic.com/photos/hike/7047408_small_1555537010.jpg", "imgSmallMed"=>"https://cdn2.apstatic.com/photos/hike/7047408_smallMed_1555537010.jpg", "imgMedium"=>"https://cdn2.apstatic.com/photos/hike/7047408_medium_1555537010.jpg", "length"=>3.7, "ascent"=>1121, "descent"=>-1120, "high"=>1287, "low"=>167, "longitude"=>-73.9903, "latitude"=>41.3127, "conditionStatus"=>"All Clear", "conditionDetails"=>"Dry", "conditionDate"=>"2020-10-18 12:56:24"}, {"id"=>7031419, "name"=>"Breakneck Ridge Bypass", "type"=>"Recommended Route", "summary"=>"Breakneck Ridge with a bypass that makes for a shorter hike.", "difficulty"=>"black", "stars"=>4.8, "starVotes"=>54, "location"=>"Cornwall-on-Hudson, New York", "url"=>"https://www.hikingproject.com/trail/7031419/breakneck-ridge-bypass", "imgSqSmall"=>"https://cdn2.apstatic.com/photos/hike/7003064_sqsmall_1554232650.jpg", "imgSmall"=>"https://cdn2.apstatic.com/photos/hike/7003064_small_1554232650.jpg", "imgSmallMed"=>"https://cdn2.apstatic.com/photos/hike/7003064_smallMed_1554232650.jpg", "imgMedium"=>"https://cdn2.apstatic.com/photos/hike/7003064_medium_1554232650.jpg", "length"=>2.8, "ascent"=>1129, "descent"=>-1135, "high"=>1164, "low"=>31, "longitude"=>-73.978, "latitude"=>41.4434, "conditionStatus"=>"All Clear", "conditionDetails"=>"", "conditionDate"=>"2020-10-10 19:46:22"}, {"id"=>7022927, "name"=>"Gertrude's Nose Loop", "type"=>"Recommended Route", "summary"=>"A moderate loop with some of the most epic views and neat rock formations in the Hudson Valley.", "difficulty"=>"blueBlack", "stars"=>4.7, "starVotes"=>41, "location"=>"Kerhonkson, New York", "url"=>"https://www.hikingproject.com/trail/7022927/gertrudes-nose-loop", "imgSqSmall"=>"https://cdn2.apstatic.com/photos/hike/7050896_sqsmall_1555691657.jpg", "imgSmall"=>"https://cdn2.apstatic.com/photos/hike/7050896_small_1555691657.jpg", "imgSmallMed"=>"https://cdn2.apstatic.com/photos/hike/7050896_smallMed_1555691657.jpg", "imgMedium"=>"https://cdn2.apstatic.com/photos/hike/7050896_medium_1555691657.jpg", "length"=>6.5, "ascent"=>864, "descent"=>-876, "high"=>1801, "low"=>1329, "longitude"=>-74.2374, "latitude"=>41.7287, "conditionStatus"=>"All Clear", "conditionDetails"=>"Dry", "conditionDate"=>"2020-10-11 13:04:02"}, {"id"=>7029363, "name"=>"Storm King Mountain", "type"=>"Recommended Route", "summary"=>"Hike to the top of Storm King Mountain and enjoy the great views of Hudson Highland State Park.", "difficulty"=>"blueBlack", "stars"=>4.7, "starVotes"=>24, "location"=>"Cornwall-on-Hudson, New York", "url"=>"https://www.hikingproject.com/trail/7029363/storm-king-mountain", "imgSqSmall"=>"https://cdn2.apstatic.com/photos/hike/7030062_sqsmall_1554926145.jpg", "imgSmall"=>"https://cdn2.apstatic.com/photos/hike/7030062_small_1554926145.jpg", "imgSmallMed"=>"https://cdn2.apstatic.com/photos/hike/7030062_smallMed_1554926145.jpg", "imgMedium"=>"https://cdn2.apstatic.com/photos/hike/7030062_medium_1554926145.jpg", "length"=>2.4, "ascent"=>455, "descent"=>-460, "high"=>1350, "low"=>971, "longitude"=>-74.0014, "latitude"=>41.4232, "conditionStatus"=>"All Clear", "conditionDetails"=>"Dry, Mostly Dry, Fallen Trees - All good", "conditionDate"=>"2020-09-24 09:43:26"}], "success"=>1} 
    end

    def self.trail_search(city, state, max_distance, max_results)
        results = Geocoder.search("#{city}, #{state}")
        lat_long = results.first.coordinates # array [latitude, longitude]
        api_response = RestClient.get("https://www.hikingproject.com/data/get-trails?lat=#{lat_long.first}&lon=#{lat_long.last}&maxDistance=#{max_distance}&maxResults=#{max_results}&key=#{$hike_key}")
        api_data = JSON.parse(api_response)
    end

    def self.trail_in_database?(api_id)
        Trail.find_by(api_id: api_id) ? true : false
    end

    #returns the PK ID of the trail
    def self.find_or_create_trail(api_id)
        if Trail.trail_in_database?(api_id)
            #finds a trail in our database
            trail = Trail.find_by(api_id: api_id)
            trail.id
        else
            #creates a new trail in our database if it doesn't exist already
            api_response = RestClient.get("https://www.hikingproject.com/data/get-trails-by-id?ids=#{api_id.to_s}&key=#{$hike_key}")
            @api_data = JSON.parse(api_response)
            new_trail = Trail.create(
                api_id: @api_data["trails"][0]["id"],
                name: @api_data["trails"][0]["name"],
                summary: @api_data["trails"][0]["summary"],
                difficulty: @api_data["trails"][0]["difficulty"],
                length: @api_data["trails"][0]["length"],
                stars: @api_data["trails"][0]["stars"],
                location: @api_data["trails"][0]["location"],
                ascent: @api_data["trails"][0]["ascent"], 
                high: @api_data["trails"][0]["high"],
                condition_status: @api_data["trails"][0]["conditionStatus"],
                condition_details: @api_data["trails"][0]["conditionDetails"],
                condition_date: @api_data["trails"][0]["conditionDate"],
                img_sq_small: @api_data["trails"][0]["imgSqSmall"],
                img_medium: @api_data["trails"][0]["imgMedium"],
                url: @api_data["trails"][0]["url"]
            )
            new_trail.id
        end
    end
end
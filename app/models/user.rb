class User < ApplicationRecord
    has_many :items
    has_many :user_hikes
    has_many :hikes, through: :user_hikes
    has_secure_password

    def past_hikes
        #needs to select only hikes that have past
        #work in progress
        #self.hikes.select { |hike| hike.end_date}
    end

    def total_miles
        #needs to only pull from past hikes
        self.hikes.map{ |hike| hike.trail.length }.sum
    end

    def highest_peak
        #returns nil if they've been on no hikes
        #needs to only pull from past hikes
        self.hikes.map { |hike| hike.trail.high }.max
    end

    def longest_ascent
        #returns nil if they've been on no hikes
        #needs to only pull from past hikes
        self.hikes.map { |hike| hike.trail.ascent }.max
    end
end

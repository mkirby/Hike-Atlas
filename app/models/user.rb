class User < ApplicationRecord
    has_many :items
    has_many :user_hikes
    has_many :hikes, through: :user_hikes
    has_secure_password

    def total_miles
        self.hikes.map{ |hike| hike.trail.length }.sum
    end

    def highest_peak
        self.hikes.map { |hike| hike.trail.high }.max
    end

    def longest_ascent
        self.hikes.map { |hike| hike.trail.ascent }.max
    end
end

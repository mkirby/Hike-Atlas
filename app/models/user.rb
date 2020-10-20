class User < ApplicationRecord
    has_many :items
    has_many :user_hikes
    has_many :hikes, through: :user_hikes
    validates :email, :email_confirmation, :password, :password_confirmation, :phone, :first_name, :last_name, :e_contact_name, :e_contact_email, :e_contact_phone, presence: true
    validates :email, uniqueness: true, confirmation: true
    validates :password, confirmation: true
    has_secure_password

    def total_hikes
        self.hikes.count
    end

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

class User < ApplicationRecord
    has_many :items
    has_many :user_hikes
    has_many :hikes, through: :user_hikes
    validates :email, :password, :phone, :first_name, :last_name, :e_contact_name, :e_contact_email, :e_contact_phone, presence: true
    validates :email, uniqueness: true
    has_secure_password

    def upcoming_hikes
        #not sure how this behaves if the end_date is the current date
        # needs to be >= Time.now for upcoming hikes
        self.hikes.select { |hike| hike.end_date > Time.now }
    end

    def past_hikes
        #not sure how this behaves if the end_date is the current date
        # needs to be <= Time.now for past hikes
        self.hikes.select { |hike| hike.end_date <= Time.now }
    end

    def total_past_hikes
        self.past_hikes.count
    end

    def total_upcoming_hikes
        self.upcoming_hikes.count
    end

    def total_miles
        self.past_hikes.map{ |hike| hike.trail.length }.sum
    end

    def highest_peak
        if self.total_past_hikes > 0
            high = self.past_hikes.map { |hike| hike.trail.high }.max
            high.to_s + " Feet"
        else
            "Create A Hike To Start Tracking Milestones."
        end
    end

    def longest_ascent
        if self.total_past_hikes > 0
            ascent = self.past_hikes.map { |hike| hike.trail.ascent }.max
            ascent.to_s + " Feet"
        else
            "Create A Hike To Start Tracking Milestones."
        end
    end
end

class User < ApplicationRecord
    has_many :items
    has_many :user_hikes
    has_many :hikes, through: :user_hikes
    has_secure_password
end

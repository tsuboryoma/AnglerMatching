class User < ApplicationRecord
    has_secure_password
    has_many :organized_fishing_trips, class_name: 'FishingTrip', foreign_key: 'organizer_id', dependent: :destroy
    has_many :participations, dependent: :destroy
    has_one :user_profile, dependent: :destroy
end

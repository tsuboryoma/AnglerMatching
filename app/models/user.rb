class User < ApplicationRecord
    has_many :organized_fishing_trips, class_name: 'FishingTrip', foreign_key: 'organizer_id'
end

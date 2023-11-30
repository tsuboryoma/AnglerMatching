class FishingTrip < ApplicationRecord
  belongs_to :organizer, class_name: 'User', foreign_key: 'organizer_id'
end

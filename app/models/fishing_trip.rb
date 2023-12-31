class FishingTrip < ApplicationRecord
  belongs_to :organizer, class_name: 'User', foreign_key: 'organizer_id'
  has_many :participations, dependent: :destroy
  has_one :chat_room, dependent: :destroy
end

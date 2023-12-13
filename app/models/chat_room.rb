class ChatRoom < ApplicationRecord
  belongs_to :fishing_trip
  has_many :messages, dependent: :destroy
end

class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :fishing_trip
  
  enum status: { pending: 0, approved: 1, declined: 2 }
end

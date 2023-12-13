class AddParticipantLimitToFishingTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :fishing_trips, :participant_limit, :integer
  end
end

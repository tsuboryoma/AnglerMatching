class SetDefaultParticipantLimitToFishingTrips < ActiveRecord::Migration[7.0]
  def up
    change_column_default :fishing_trips, :participant_limit, from: nil, to: 0
  end

  def down
    change_column_default :fishing_trips, :participant_limit, from: 0, to: nil
  end
end

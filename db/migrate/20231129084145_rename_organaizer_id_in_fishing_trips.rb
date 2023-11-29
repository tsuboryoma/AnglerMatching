class RenameOrganaizerIdInFishingTrips < ActiveRecord::Migration[7.0]
  def change
    rename_column :fishing_trips, :organaizer_id, :organizer_id
  end
end

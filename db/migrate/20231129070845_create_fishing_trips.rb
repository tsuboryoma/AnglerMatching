class CreateFishingTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :fishing_trips do |t|
      t.references :organizer, null: false, foreign_key: { to_table: :users }
      t.string :title
      t.text :description
      t.string :location
      t.date :start_date

      t.timestamps
    end
  end
end

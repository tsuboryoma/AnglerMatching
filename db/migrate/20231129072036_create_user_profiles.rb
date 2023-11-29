class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.integer :age
      t.string :biography
      t.string :region
      t.integer :experience_years
      t.string :favorite_fishing_type

      t.timestamps
    end
  end
end

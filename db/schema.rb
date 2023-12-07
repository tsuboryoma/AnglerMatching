# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_07_055537) do
  create_table "fishing_trips", force: :cascade do |t|
    t.integer "organizer_id", null: false
    t.string "title"
    t.text "description"
    t.string "location"
    t.date "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "participant_limit", default: 0
    t.index ["organizer_id"], name: "index_fishing_trips_on_organizer_id"
  end

  create_table "participations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "fishing_trip_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fishing_trip_id"], name: "index_participations_on_fishing_trip_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "trip_participants", force: :cascade do |t|
    t.integer "fishing_trip_id", null: false
    t.integer "user_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fishing_trip_id"], name: "index_trip_participants_on_fishing_trip_id"
    t.index ["user_id"], name: "index_trip_participants_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "age"
    t.string "biography"
    t.string "region"
    t.integer "experience_years"
    t.string "favorite_fishing_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fishing_trips", "users", column: "organizer_id"
  add_foreign_key "participations", "fishing_trips"
  add_foreign_key "participations", "users"
  add_foreign_key "trip_participants", "fishing_trips"
  add_foreign_key "trip_participants", "users"
end

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

ActiveRecord::Schema[7.1].define(version: 2024_08_13_133249) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "fight_type"
    t.string "place"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "target"
    t.string "description"
    t.bigint "user_id", null: false
    t.bigint "fighter_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_private", default: true
    t.index ["fighter_id"], name: "index_events_on_fighter_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "fighters", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.date "birth_date"
    t.float "height"
    t.float "weight"
    t.string "fight_style"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price"
    t.boolean "have_insurance", default: false
    t.index ["user_id"], name: "index_fighters_on_user_id"
  end

  create_table "fighters_availabilities", force: :cascade do |t|
    t.bigint "fighter_id", null: false
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fighter_id"], name: "index_fighters_availabilities_on_fighter_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.boolean "user_to_fighter"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_reviews_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "fighters"
  add_foreign_key "events", "users"
  add_foreign_key "fighters", "users"
  add_foreign_key "fighters_availabilities", "fighters"
  add_foreign_key "reviews", "events"
end

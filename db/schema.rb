# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170814220622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aircrafts", force: :cascade do |t|
    t.string "tail_number"
    t.integer "first_class_capacity"
    t.integer "business_class_capacity"
    t.integer "economy_class_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "iata_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state_id"
    t.index ["state_id"], name: "index_airports_on_state_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "booking_reference"
    t.decimal "booking_fee"
    t.string "passenger_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "users_id"
    t.integer "flight_id"
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
    t.index ["users_id"], name: "index_bookings_on_users_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "currency"
    t.string "country_code"
    t.string "exchange_rate"
    t.string "iso_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "arrival_date"
    t.datetime "departure_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "aircraft_id"
    t.integer "airport_id"
    t.index ["aircraft_id"], name: "index_flights_on_aircraft_id"
    t.index ["airport_id"], name: "index_flights_on_airport_id"
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "payment_date"
    t.string "transaction_ref"
    t.string "payment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "booking_id"
    t.index ["booking_id"], name: "index_payments_on_booking_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "country_id"
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "phone_number"
    t.string "password_digest"
    t.string "confirm_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

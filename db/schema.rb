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

ActiveRecord::Schema[7.0].define(version: 2023_10_18_194258) do
  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "profile_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.boolean "status"
    t.datetime "check_in"
    t.datetime "check_out"
    t.integer "space_id", null: false
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount"
    t.index ["client_id"], name: "index_bookings_on_client_id"
    t.index ["space_id"], name: "index_bookings_on_space_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "profile_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "amount"
    t.integer "booking_id", null: false
    t.datetime "payment_date"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_payments_on_booking_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "price"
    t.boolean "status"
    t.string "image"
    t.text "description"
    t.integer "contact"
    t.integer "admin_id", null: false
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_spaces_on_admin_id"
    t.index ["client_id"], name: "index_spaces_on_client_id"
  end

  add_foreign_key "bookings", "clients"
  add_foreign_key "bookings", "spaces"
  add_foreign_key "payments", "bookings"
  add_foreign_key "spaces", "admins"
  add_foreign_key "spaces", "clients"
end

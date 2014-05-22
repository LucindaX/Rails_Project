# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140521171838) do

  create_table "booked_rooms", force: true do |t|
    t.date     "from_date",  null: false
    t.date     "to_date",    null: false
    t.integer  "quantity",   null: false
    t.integer  "room_id"
    t.integer  "hotel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "booked_rooms", ["hotel_id"], name: "index_booked_rooms_on_hotel_id", using: :btree
  add_index "booked_rooms", ["room_id"], name: "index_booked_rooms_on_room_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.string   "head",       limit: 50,                          null: false
    t.text     "body",                                           null: false
    t.decimal  "rating",                precision: 10, scale: 0, null: false
    t.integer  "hotel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["hotel_id"], name: "index_comments_on_hotel_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "hotel_pics", force: true do |t|
    t.string   "avatar",     limit: 50, null: false
    t.integer  "hotel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hotel_pics", ["hotel_id"], name: "index_hotel_pics_on_hotel_id", using: :btree

  create_table "hotels", force: true do |t|
    t.string   "name",       limit: 25,                                      null: false
    t.string   "avatar",     limit: 50,                                      null: false
    t.string   "city",       limit: 25,                                      null: false
    t.string   "country",    limit: 25,                                      null: false
    t.text     "desc",                                                       null: false
    t.decimal  "rating",                precision: 10, scale: 0,             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "votes",                                          default: 0
  end

  create_table "rooms", force: true do |t|
    t.string   "room_type",  limit: 50,                          null: false
    t.string   "avatar",     limit: 50,                          null: false
    t.decimal  "quantity",              precision: 10, scale: 0, null: false
    t.text     "descs",                                          null: false
    t.decimal  "price",                 precision: 10, scale: 0, null: false
    t.integer  "hotel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rooms", ["hotel_id"], name: "index_rooms_on_hotel_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

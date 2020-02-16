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

ActiveRecord::Schema.define(version: 20200127110639) do

  create_table "answers", force: :cascade do |t|
    t.integer  "inquiry_id"
    t.text     "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "board_messages", force: :cascade do |t|
    t.integer  "board_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boards", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.text     "remarks"
    t.string   "images"
    t.string   "condition"
    t.date     "available_period"
    t.string   "book_name"
    t.integer  "isbn_num",         limit: 8
    t.string   "category"
    t.integer  "decide_price"
    t.string   "title"
    t.string   "author"
  end

  create_table "books", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name"
    t.integer  "isbn_num",     limit: 8
    t.string   "images"
    t.string   "edition"
    t.string   "author"
    t.string   "category"
    t.string   "condition"
    t.integer  "rental_price"
    t.text     "book_details"
    t.integer  "normal_price"
    t.string   "publisher"
  end

  create_table "entries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_entries_on_room_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "board_id"
    t.index ["board_id"], name: "index_favorites_on_board_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "last_name_kana"
    t.string   "first_name_kana"
    t.string   "icon"
    t.integer  "postcode"
    t.integer  "prefecture_code"
    t.string   "address_city"
    t.string   "address_street"
    t.string   "address_building"
    t.string   "college"
    t.string   "major"
    t.string   "gender"
    t.string   "hidden_status"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

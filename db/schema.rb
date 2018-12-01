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

ActiveRecord::Schema.define(version: 20181201211054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_rooms", force: :cascade do |t|
    t.string   "access_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.string   "address"
    t.string   "end_date"
  end

  create_table "hints", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "link"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hints_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.integer  "game_room_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "deer_id"
    t.integer  "score",        default: 0
    t.index ["game_room_id"], name: "index_users_on_game_room_id", using: :btree
  end

  add_foreign_key "hints", "users"
  add_foreign_key "users", "game_rooms"
end

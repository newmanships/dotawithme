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

ActiveRecord::Schema.define(version: 20150525015057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: true do |t|
    t.string   "recipient"
    t.string   "from"
    t.text     "note"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.boolean  "one"
    t.boolean  "two"
    t.boolean  "three"
    t.boolean  "four"
    t.boolean  "five"
    t.integer  "rank"
    t.string   "language"
    t.string   "location"
    t.string   "playerSteamID"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.integer  "solommr"
    t.string   "style",         default: "Any"
    t.string   "languageTwo",   default: "None"
    t.boolean  "online",        default: false
  end

  create_table "searches", force: true do |t|
    t.boolean  "one"
    t.boolean  "two"
    t.boolean  "three"
    t.boolean  "four"
    t.boolean  "five"
    t.string   "language"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "style",       default: "Any"
    t.string   "languageTwo"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "rank"
    t.text     "description"
    t.string   "location"
    t.string   "language"
    t.text     "defaultMessage"
    t.string   "leaderSteamID"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "style"
    t.boolean  "one"
    t.boolean  "two"
    t.boolean  "three"
    t.boolean  "four"
    t.boolean  "five"
    t.string   "languageTwo",    default: "None"
  end

end

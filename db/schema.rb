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

ActiveRecord::Schema.define(version: 20150401150823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "families", force: :cascade do |t|
    t.string   "name"
    t.string   "profpic"
    t.string   "housepic"
    t.string   "bio"
    t.string   "tagline"
    t.string   "hostdates"
    t.boolean  "pvtbed"
    t.boolean  "pvtbath"
    t.integer  "beds"
    t.integer  "baths"
    t.integer  "size"
    t.string   "lifehere"
    t.string   "features"
    t.string   "attracts"
    t.string   "country"
    t.string   "city"
    t.string   "address"
    t.string   "age_range",  default: [],              array: true
    t.string   "morepics",   default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "previous_hosting", id: false, force: :cascade do |t|
    t.integer "family_id"
    t.integer "traveler_id"
  end

  create_table "save_interest", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "family_id"
  end

  create_table "travelers", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "destinations", default: [],              array: true
    t.string   "trvldates"
    t.string   "bio"
    t.string   "tagline"
    t.string   "pic"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "family_id"
  end

  add_index "travelers", ["family_id"], name: "index_travelers_on_family_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "country"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "family_id"
  end

  add_index "users", ["family_id"], name: "index_users_on_family_id", using: :btree

  add_foreign_key "travelers", "families"
  add_foreign_key "users", "families"
end

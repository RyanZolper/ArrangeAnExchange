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

ActiveRecord::Schema.define(version: 20150504175357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "connections", force: :cascade do |t|
    t.integer  "family_id"
    t.integer  "traveler_id"
    t.text     "hostreview"
    t.text     "travreview"
    t.float    "hoststars"
    t.float    "travstars"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "connections", ["family_id"], name: "index_connections_on_family_id", using: :btree
  add_index "connections", ["traveler_id"], name: "index_connections_on_traveler_id", using: :btree

  create_table "fam_attachments", force: :cascade do |t|
    t.integer  "family_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fam_attachments", ["family_id"], name: "index_fam_attachments_on_family_id", using: :btree

  create_table "families", force: :cascade do |t|
    t.string   "name"
    t.string   "profpic"
    t.string   "housepic"
    t.text     "bio"
    t.string   "tagline"
    t.string   "hostdates"
    t.boolean  "pvtbed"
    t.boolean  "pvtbath"
    t.integer  "beds"
    t.integer  "baths"
    t.integer  "size"
    t.text     "lifehere"
    t.string   "features",   default: [],                array: true
    t.text     "attracts"
    t.string   "country"
    t.string   "city"
    t.string   "address"
    t.string   "age_range",  default: [],                array: true
    t.string   "morepics",   default: [],                array: true
    t.boolean  "smokers"
    t.string   "env"
    t.boolean  "showing",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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
    t.text     "bio"
    t.string   "tagline"
    t.string   "pic"
    t.integer  "family_id"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "sex"
  end

  add_index "travelers", ["family_id"], name: "index_travelers_on_family_id", using: :btree
  add_index "travelers", ["user_id"], name: "index_travelers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "country"
    t.string   "password_digest"
    t.integer  "family_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
    t.boolean  "changedpwd",      default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name"
    t.date     "bd"
  end

  add_index "users", ["family_id"], name: "index_users_on_family_id", using: :btree

end

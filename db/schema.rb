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

ActiveRecord::Schema.define(version: 20160325162629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artistic_values", force: :cascade do |t|
    t.text     "description"
    t.integer  "church_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "churches", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "year"
    t.text     "year_note"
    t.string   "architecture"
    t.integer  "distance"
    t.string   "make"
    t.string   "region"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "background"
    t.text     "bg_title1"
    t.text     "bg_title2"
    t.string   "fact_title"
    t.integer  "artistic_value"
    t.integer  "photo_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "facts", force: :cascade do |t|
    t.text     "description"
    t.integer  "church_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "panos", force: :cascade do |t|
    t.text     "pano_id"
    t.integer  "church_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "suggestions", force: :cascade do |t|
    t.string "church"
    t.string "category"
    t.text   "suggestion"
  end

  create_table "timeline_points", force: :cascade do |t|
    t.string   "year"
    t.text     "description"
    t.integer  "church_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "travel_times", force: :cascade do |t|
    t.string   "transportation"
    t.integer  "hours"
    t.integer  "minutes"
    t.integer  "church_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end

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

ActiveRecord::Schema.define(version: 20160301191904) do

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
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "facts", force: :cascade do |t|
    t.text     "description"
    t.integer  "church_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

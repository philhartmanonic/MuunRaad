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

ActiveRecord::Schema.define(version: 20170812023416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "full_moons", force: :cascade do |t|
    t.date "moon_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "full_moon_date"
    t.date "last_date"
  end

  create_table "muuns", force: :cascade do |t|
    t.integer "lunar_number"
    t.string "german_name"
    t.string "english_name"
    t.string "personal_description"
    t.string "lunar_description"
    t.string "picture_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

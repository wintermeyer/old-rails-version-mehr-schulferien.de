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

ActiveRecord::Schema.define(version: 20150103171456) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "zip_code"
    t.integer  "federal_state_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "cities", ["federal_state_id"], name: "index_cities_on_federal_state_id"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "url_prefix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "countries", ["slug"], name: "index_countries_on_slug", unique: true
  add_index "countries", ["url_prefix"], name: "index_countries_on_url_prefix", unique: true

  create_table "federal_states", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "federal_states", ["slug"], name: "index_federal_states_on_slug", unique: true

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "holidays", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "periods", force: :cascade do |t|
    t.date     "first_day"
    t.date     "last_day"
    t.integer  "holiday_id"
    t.integer  "periodable_id"
    t.string   "periodable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "periods", ["holiday_id"], name: "index_periods_on_holiday_id"
  add_index "periods", ["periodable_type", "periodable_id"], name: "index_periods_on_periodable_type_and_periodable_id"

  create_table "phone_numbers", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "phone_numberable_id"
    t.string   "phone_numberable_type"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "street"
    t.string   "zip_code"
    t.string   "address_city_name"
    t.string   "email_address"
    t.string   "homepage_url"
    t.integer  "city_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "schools", ["city_id"], name: "index_schools_on_city_id"

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "email"
    t.date     "birthday"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end

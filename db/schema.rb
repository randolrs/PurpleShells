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

ActiveRecord::Schema.define(version: 20160708154551) do

  create_table "cities", force: true do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "class_topics", force: true do |t|
    t.integer  "parent_topic_id"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_sessions", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_label", default: "Session"
  end

  create_table "courses", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.integer  "location_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",       precision: 8, scale: 2
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "address_street"
    t.string   "address_city"
    t.string   "address_state_or_province"
    t.string   "address_postal_code"
    t.string   "country"
    t.integer  "student_capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                     default: "",    null: false
    t.string   "encrypted_password",        default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_teacher",                default: false
    t.string   "name"
    t.integer  "source_id"
    t.boolean  "has_active_payment_method", default: false
    t.integer  "default_location",          default: 1
    t.integer  "default_city_id"
    t.integer  "city_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

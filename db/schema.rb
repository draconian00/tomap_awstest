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

ActiveRecord::Schema.define(version: 20150909085555) do

  create_table "articles", force: :cascade do |t|
    t.integer  "test_center_id"
    t.string   "title"
    t.string   "testcenter"
    t.string   "content"
    t.string   "author"
    t.float    "location_point"
    t.string   "location_content"
    t.float    "facility_point"
    t.string   "facility_content"
    t.float    "computer_point"
    t.string   "computer_content"
    t.float    "avg_point"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "counters", force: :cascade do |t|
    t.integer  "plus"
    t.integer  "minus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "article_id"
    t.string   "click_like_person"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "article_id"
    t.string   "content"
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_centers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "position_lat"
    t.string   "position_lng"
    t.string   "region_code"
    t.float    "location_point"
    t.float    "facility_point"
    t.float    "computer_point"
    t.float    "avg_point"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "image"
    t.string   "nickname"
    t.string   "phone_number"
    t.string   "living_region"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

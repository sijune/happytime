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

ActiveRecord::Schema.define(version: 20181121133152) do

  create_table "addresses", force: :cascade do |t|
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.string   "title"
    t.string   "time"
    t.string   "content"
    t.string   "image"
    t.string   "lat"
    t.string   "lng"
    t.integer  "user_id"
    t.integer  "category"
    t.string   "username"
    t.string   "address"
    t.string   "start_date"
    t.string   "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "time"
    t.string   "content"
    t.string   "image"
    t.string   "lat"
    t.string   "lng"
    t.integer  "user_id"
    t.integer  "category"
    t.string   "username"
    t.string   "address"
    t.string   "price"
    t.string   "start_date"
    t.string   "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "thumb"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "address",                default: "", null: false
    t.string   "lat",                    default: "", null: false
    t.string   "lng",                    default: "", null: false
    t.string   "category",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

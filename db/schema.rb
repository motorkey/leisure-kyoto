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

ActiveRecord::Schema.define(version: 20150721183058) do

  create_table "event_days", force: :cascade do |t|
    t.date     "event_on"
    t.integer  "event_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "event_days", ["event_id"], name: "index_event_days_on_event_id", using: :btree

  create_table "event_photos", force: :cascade do |t|
    t.integer  "event_id",   limit: 4,                null: false
    t.string   "image",      limit: 255, default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "event_reservations", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "number",       limit: 4
    t.string   "mail",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "event_day_id", limit: 4
    t.integer  "event_id",     limit: 4
  end

  add_index "event_reservations", ["mail", "event_day_id"], name: "index_event_reservations_on_mail_and_event_day_id", unique: true, using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "address",     limit: 255
    t.integer  "capacity",    limit: 4
    t.integer  "price",       limit: 4
    t.string   "author",      limit: 255
  end

  add_index "events", ["name"], name: "index_events_on_name", unique: true, using: :btree

  create_table "managers", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "remember_token",  limit: 255
  end

  add_index "managers", ["email"], name: "index_managers_on_email", unique: true, using: :btree
  add_index "managers", ["remember_token"], name: "index_managers_on_remember_token", using: :btree

  add_foreign_key "event_days", "events"
end

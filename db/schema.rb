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

ActiveRecord::Schema.define(version: 20151129084931) do

  create_table "tasting_packages", force: :cascade do |t|
    t.string   "name",       limit: 255,                         null: false
    t.decimal  "price",                  precision: 8, scale: 2, null: false
    t.string   "state",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "email",                  limit: 255,                 null: false
    t.string   "encrypted_password",     limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "admin",                              default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wine_packages", force: :cascade do |t|
    t.integer  "wine_id",            limit: 4
    t.integer  "tasting_package_id", limit: 4
    t.string   "wine_tasting_code",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wine_packages", ["tasting_package_id"], name: "fk_rails_f76832511a", using: :btree
  add_index "wine_packages", ["wine_id", "tasting_package_id", "wine_tasting_code"], name: "uniq_package", unique: true, using: :btree

  create_table "wines", force: :cascade do |t|
    t.string   "name",        limit: 255,                           null: false
    t.string   "region",      limit: 255
    t.string   "wine_type",   limit: 255
    t.text     "description", limit: 65535
    t.text     "fun_facts",   limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",                     precision: 8, scale: 2
  end

  add_index "wines", ["name"], name: "index_wines_on_name", using: :btree

  add_foreign_key "wine_packages", "tasting_packages"
  add_foreign_key "wine_packages", "wines"
end
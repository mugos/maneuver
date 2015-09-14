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

ActiveRecord::Schema.define(version: 20150902135229) do

  create_table "apps", force: :cascade do |t|
    t.string   "name"
    t.text     "script"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apps_hosts", id: false, force: :cascade do |t|
    t.integer "app_id",  null: false
    t.integer "host_id", null: false
  end

  create_table "gits", force: :cascade do |t|
    t.string   "url"
    t.string   "user_name"
    t.string   "repo_name"
    t.string   "request_token"
    t.string   "request_secret"
    t.string   "consumer_key"
    t.string   "consumer_secret"
    t.string   "net_http"
    t.integer  "repo_type",       default: 0
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gits", ["app_id"], name: "index_gits_on_app_id"

  create_table "hosts", force: :cascade do |t|
    t.string  "name"
    t.string  "address"
    t.string  "sys_user"
    t.string  "source"
    t.integer "key_id"
  end

  add_index "hosts", ["key_id"], name: "index_hosts_on_key_id"

  create_table "keys", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

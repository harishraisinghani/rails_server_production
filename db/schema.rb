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

ActiveRecord::Schema.define(version: 20160912222524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.boolean  "false_alarm"
    t.boolean  "user_generated"
    t.string   "state"
    t.integer  "dispatcher_id"
    t.integer  "patroller_id"
    t.integer  "ping_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["dispatcher_id"], name: "index_alerts_on_dispatcher_id", using: :btree
    t.index ["patroller_id"], name: "index_alerts_on_patroller_id", using: :btree
    t.index ["ping_id"], name: "index_alerts_on_ping_id", using: :btree
  end

  create_table "checkins", force: :cascade do |t|
    t.datetime "checkout"
    t.integer  "destination_id"
    t.integer  "skier_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["destination_id"], name: "index_checkins_on_destination_id", using: :btree
    t.index ["skier_id"], name: "index_checkins_on_skier_id", using: :btree
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "long"
    t.float    "radius"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dispatchers", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "on_shift"
    t.integer  "destination_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["destination_id"], name: "index_dispatchers_on_destination_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "skier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_memberships_on_group_id", using: :btree
    t.index ["skier_id"], name: "index_memberships_on_skier_id", using: :btree
  end

  create_table "patrollers", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "on_shift"
    t.integer  "destination_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "token"
    t.index ["destination_id"], name: "index_patrollers_on_destination_id", using: :btree
  end

  create_table "pings", force: :cascade do |t|
    t.float    "lat"
    t.float    "long"
    t.integer  "checkin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checkin_id"], name: "index_pings_on_checkin_id", using: :btree
  end

  create_table "skiers", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "ec1"
    t.string   "ec1phone"
    t.string   "ec2"
    t.string   "ec2phone"
    t.integer  "current_checkin_id"
    t.string   "username"
    t.string   "profile_picture"
    t.string   "phone"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "token"
  end

  add_foreign_key "alerts", "dispatchers"
  add_foreign_key "alerts", "patrollers"
  add_foreign_key "alerts", "pings"
  add_foreign_key "checkins", "destinations"
  add_foreign_key "checkins", "skiers"
  add_foreign_key "dispatchers", "destinations"
  add_foreign_key "memberships", "groups"
  add_foreign_key "memberships", "skiers"
  add_foreign_key "patrollers", "destinations"
  add_foreign_key "pings", "checkins"
end

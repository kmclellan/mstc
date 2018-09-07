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

ActiveRecord::Schema.define(version: 2018_09_06_182603) do

  create_table "resources", force: :cascade do |t|
    t.string "description"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["title"], name: "index_resources_on_title", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.integer "usertype_id"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "address"
    t.integer "tel_home"
    t.integer "tel_mob"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["usertype_id"], name: "index_users_on_usertype_id"
  end

  create_table "usertypes", force: :cascade do |t|
    t.text "user_type"
  end

end

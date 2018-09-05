# frozen_string_literal: true

ActiveRecord::Schema.define(version: 2018_08_19_232605) do
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["usertype_id"], name: "index_users_on_usertype_id"
  end

  create_table "usertypes", force: :cascade do |t|
    t.text "user_type"
  end
end

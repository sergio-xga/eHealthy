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

ActiveRecord::Schema.define(version: 20160909165304) do

  create_table "admin_service_providers", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_service_providers", ["email"], name: "index_admin_service_providers_on_email", unique: true, using: :btree
  add_index "admin_service_providers", ["reset_password_token"], name: "index_admin_service_providers_on_reset_password_token", unique: true, using: :btree

  create_table "administrators", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "administrators", ["email"], name: "index_administrators_on_email", unique: true, using: :btree
  add_index "administrators", ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true, using: :btree

  create_table "clinic_events", force: :cascade do |t|
    t.string   "diagnostic",        limit: 255
    t.string   "prediagnostic",     limit: 255
    t.string   "symptoms",          limit: 255
    t.date     "date_start"
    t.date     "date_finish"
    t.string   "prescription",      limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "clinic_profile_id", limit: 4
  end

  add_index "clinic_events", ["clinic_profile_id"], name: "index_clinic_events_on_clinic_profile_id", using: :btree

  create_table "clinic_profiles", force: :cascade do |t|
    t.string   "first_name",   limit: 255
    t.string   "last_name",    limit: 255
    t.date     "birthday"
    t.string   "relationship", limit: 255
    t.string   "genre",        limit: 255
    t.string   "blood",        limit: 255
    t.string   "height",       limit: 255
    t.string   "weight",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",      limit: 4
  end

  add_index "clinic_profiles", ["user_id"], name: "index_clinic_profiles_on_user_id", using: :btree

  create_table "hospital_requests", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "telephone",  limit: 255
    t.string   "message",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "telephone",  limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "country",    limit: 255
    t.string   "specialty",  limit: 255
    t.string   "ubication",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "floor",       limit: 4
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "hospital_id", limit: 4
  end

  add_index "rooms", ["hospital_id"], name: "index_rooms_on_hospital_id", using: :btree

  create_table "service_providers", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hospital_id",            limit: 4
  end

  add_index "service_providers", ["email"], name: "index_service_providers_on_email", unique: true, using: :btree
  add_index "service_providers", ["hospital_id"], name: "index_service_providers_on_hospital_id", using: :btree
  add_index "service_providers", ["reset_password_token"], name: "index_service_providers_on_reset_password_token", unique: true, using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "subject",    limit: 255
    t.date     "schedule"
    t.string   "comment",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "services", ["user_id"], name: "index_services_on_user_id", using: :btree

  create_table "services_rooms", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "room_id",    limit: 4
    t.integer  "service_id", limit: 4
  end

  create_table "services_to_service_providers", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "service_id",          limit: 4
    t.integer  "service_provider_id", limit: 4
  end

  create_table "specialist_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "specialist_users", ["email"], name: "index_specialist_users_on_email", unique: true, using: :btree
  add_index "specialist_users", ["reset_password_token"], name: "index_specialist_users_on_reset_password_token", unique: true, using: :btree

  create_table "topic_comments", force: :cascade do |t|
    t.string   "message",            limit: 255
    t.integer  "response_to",        limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "specialist_user_id", limit: 4
    t.integer  "topic_id",           limit: 4
  end

  add_index "topic_comments", ["specialist_user_id"], name: "index_topic_comments_on_specialist_user_id", using: :btree
  add_index "topic_comments", ["topic_id"], name: "index_topic_comments_on_topic_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "subject",            limit: 255
    t.string   "description",        limit: 255
    t.string   "body",               limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "specialist_user_id", limit: 4
  end

  add_index "topics", ["specialist_user_id"], name: "index_topics_on_specialist_user_id", using: :btree

  create_table "user_comments", force: :cascade do |t|
    t.string   "subject",    limit: 255
    t.string   "message",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "user_comments", ["user_id"], name: "index_user_comments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",     null: false
    t.string   "encrypted_password",     limit: 255, default: "",     null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "user_type",              limit: 255, default: "user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "clinic_events", "clinic_profiles"
  add_foreign_key "clinic_profiles", "users"
  add_foreign_key "rooms", "hospitals"
  add_foreign_key "service_providers", "hospitals"
  add_foreign_key "services", "users"
  add_foreign_key "topic_comments", "specialist_users"
  add_foreign_key "topic_comments", "topics"
  add_foreign_key "topics", "specialist_users"
  add_foreign_key "user_comments", "users"
end

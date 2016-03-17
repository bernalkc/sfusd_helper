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

ActiveRecord::Schema.define(version: 20160312195650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string   "description"
    t.integer  "child_id"
    t.integer  "grade_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "applications", ["child_id"], name: "index_applications_on_child_id", using: :btree
  add_index "applications", ["grade_id"], name: "index_applications_on_grade_id", using: :btree

  create_table "children", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.date     "birthday"
    t.string   "current_school"
    t.boolean  "enrollment_status"
    t.integer  "family_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "children", ["family_id"], name: "index_children_on_family_id", using: :btree

  create_table "families", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "zip_code"
    t.string   "census_tract"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "families", ["email"], name: "index_families_on_email", unique: true, using: :btree
  add_index "families", ["reset_password_token"], name: "index_families_on_reset_password_token", unique: true, using: :btree

  create_table "grades", force: :cascade do |t|
    t.string   "program"
    t.string   "school_grade"
    t.integer  "school_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "grades", ["school_id"], name: "index_grades_on_school_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "applications", "children"
  add_foreign_key "applications", "grades"
  add_foreign_key "children", "families"
  add_foreign_key "grades", "schools"
end

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

ActiveRecord::Schema.define(version: 20160311073956) do

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
    t.string   "parent_1"
    t.string   "parent_2"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "address_3"
    t.string   "address_4"
    t.string   "email"
    t.string   "language_1"
    t.string   "language_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

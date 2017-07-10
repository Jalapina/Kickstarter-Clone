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

ActiveRecord::Schema.define(version: 20170629231829) do

  create_table "backers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "backers", ["project_id"], name: "index_backers_on_project_id"
  add_index "backers", ["user_id"], name: "index_backers_on_user_id"

  create_table "follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "follower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "category"
    t.string   "residence"
    t.decimal  "goal"
    t.integer  "duration"
    t.text     "blur"
    t.integer  "user_id"
    t.string   "location"
    t.boolean  "launch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "rewards", force: :cascade do |t|
    t.string   "title"
    t.integer  "pledged"
    t.text     "description"
    t.boolean  "shipping"
    t.integer  "limit"
    t.date     "delivery"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "rewards", ["project_id"], name: "index_rewards_on_project_id"

  create_table "stories", force: :cascade do |t|
    t.text     "description"
    t.text     "risk"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "stories", ["project_id"], name: "index_stories_on_project_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "website"
    t.text     "bio"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end

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

ActiveRecord::Schema.define(version: 20170822203013) do

  create_table "adoptions", force: :cascade do |t|
    t.integer  "puppy_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",     default: 1
    t.integer  "order_id"
    t.datetime "delivered_on"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discussion_posts", force: :cascade do |t|
    t.string   "nickname"
    t.text     "body"
    t.integer  "parent_id"
    t.integer  "lft",                        null: false
    t.integer  "rgt",                        null: false
    t.integer  "depth",          default: 0, null: false
    t.integer  "children_count", default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["lft"], name: "index_discussion_posts_on_lft"
    t.index ["parent_id"], name: "index_discussion_posts_on_parent_id"
    t.index ["rgt"], name: "index_discussion_posts_on_rgt"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_children"
    t.boolean  "has_other_pets"
    t.string   "other_pets_description"
  end

  create_table "puppies", force: :cascade do |t|
    t.string   "name"
    t.string   "breed"
    t.string   "description"
    t.string   "gender"
    t.string   "image_url"
    t.decimal  "fees",        precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

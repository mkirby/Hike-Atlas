# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_08_212631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hike_items", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "hike_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hike_id"], name: "index_hike_items_on_hike_id"
    t.index ["item_id"], name: "index_hike_items_on_item_id"
  end

  create_table "hikes", force: :cascade do |t|
    t.bigint "trail_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trail_id"], name: "index_hikes_on_trail_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "weight"
    t.integer "cost"
    t.string "condition"
    t.string "note"
    t.string "url"
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "trails", force: :cascade do |t|
    t.integer "api_id"
    t.string "name"
    t.string "summary"
    t.string "difficulty"
    t.float "stars"
    t.string "location"
    t.string "img_sq_small"
    t.string "img_medium"
    t.float "length"
    t.integer "ascent"
    t.integer "high"
    t.string "condition_status"
    t.string "condition_details"
    t.string "condition_date"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "user_hikes", force: :cascade do |t|
    t.bigint "hike_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hike_id"], name: "index_user_hikes_on_hike_id"
    t.index ["user_id"], name: "index_user_hikes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "first_name"
    t.string "last_name"
    t.string "e_contact_name"
    t.string "e_contact_email"
    t.string "e_contact_phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "hike_items", "hikes"
  add_foreign_key "hike_items", "items"
  add_foreign_key "hikes", "trails"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users"
  add_foreign_key "user_hikes", "hikes"
  add_foreign_key "user_hikes", "users"
end

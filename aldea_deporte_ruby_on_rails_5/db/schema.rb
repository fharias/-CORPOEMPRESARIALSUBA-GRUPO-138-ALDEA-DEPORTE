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

ActiveRecord::Schema.define(version: 20180915230605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "description", default: "", null: false
    t.date "date", null: false
    t.string "age_limit", default: "", null: false
    t.string "status", default: "", null: false
    t.bigint "user_id"
    t.bigint "headquarter_id"
    t.bigint "sport_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["headquarter_id"], name: "index_events_on_headquarter_id"
    t.index ["sport_category_id"], name: "index_events_on_sport_category_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "headquarters", force: :cascade do |t|
    t.string "description", limit: 255, default: "", null: false
    t.string "status", limit: 50, default: "", null: false
    t.string "address", limit: 255, default: "", null: false
    t.string "latitude", limit: 45, default: "", null: false
    t.string "longitude", limit: 45, default: "", null: false
    t.bigint "localities_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_headquarters_on_description", unique: true
    t.index ["localities_id"], name: "index_headquarters_on_localities_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "description", default: "", null: false
    t.string "url", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images_events", force: :cascade do |t|
    t.bigint "image_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_images_events_on_event_id"
    t.index ["image_id"], name: "index_images_events_on_image_id"
  end

  create_table "images_headquarters", force: :cascade do |t|
    t.bigint "image_id"
    t.bigint "headquarter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["headquarter_id"], name: "index_images_headquarters_on_headquarter_id"
    t.index ["image_id"], name: "index_images_headquarters_on_image_id"
  end

  create_table "localities", force: :cascade do |t|
    t.string "description", limit: 100, default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_localities_on_description", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 45, default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "sport_categories", force: :cascade do |t|
    t.string "description", limit: 100, default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_sport_categories_on_description", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.date "birthday", null: false
    t.string "phone"
    t.string "document_type"
    t.string "document"
    t.string "document_file"
    t.string "photo"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document"], name: "index_users_on_document", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  create_table "users_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "events", "headquarters"
  add_foreign_key "events", "sport_categories"
  add_foreign_key "events", "users"
  add_foreign_key "headquarters", "localities", column: "localities_id"
  add_foreign_key "images_events", "events"
  add_foreign_key "images_events", "images"
  add_foreign_key "images_headquarters", "headquarters"
  add_foreign_key "images_headquarters", "images"
  add_foreign_key "users_roles", "roles"
  add_foreign_key "users_roles", "users"
end

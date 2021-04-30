# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_30_023324) do

  create_table "project_returns", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.integer "price"
    t.integer "capacity"
    t.date "delivery_date"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_returns_on_project_id"
  end

  create_table "project_supports", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "project_return_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_return_id", "user_id"], name: "index_project_supports_on_project_return_id_and_user_id", unique: true
    t.index ["project_return_id"], name: "index_project_supports_on_project_return_id"
    t.index ["user_id"], name: "index_project_supports_on_user_id"
  end

  create_table "projects", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.integer "target_amount"
    t.date "due_date"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  add_foreign_key "project_returns", "projects"
  add_foreign_key "project_supports", "project_returns"
  add_foreign_key "project_supports", "users"
  add_foreign_key "projects", "users"
end

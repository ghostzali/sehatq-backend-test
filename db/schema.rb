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

ActiveRecord::Schema.define(version: 2021_06_02_122722) do

  create_table "doctors", charset: "utf8mb4", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "specialty_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_doctors_on_code", unique: true
    t.index ["specialty_id"], name: "index_doctors_on_specialty_id"
  end

  create_table "hospitals", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", charset: "utf8mb4", force: :cascade do |t|
    t.string "code"
    t.integer "queue_number"
    t.date "queue_date"
    t.bigint "schedule_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_orders_on_code", unique: true
    t.index ["schedule_id"], name: "index_orders_on_schedule_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "placements", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.bigint "hospital_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_placements_on_doctor_id"
    t.index ["hospital_id"], name: "index_placements_on_hospital_id"
  end

  create_table "roles", charset: "utf8mb4", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_roles_on_code", unique: true
  end

  create_table "schedules", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "doctor_id"
    t.string "day_name"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_schedules_on_doctor_id"
  end

  create_table "specialties", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "fullname"
    t.bigint "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "doctors", "specialties"
  add_foreign_key "placements", "doctors"
  add_foreign_key "placements", "hospitals"
  add_foreign_key "schedules", "doctors"
  add_foreign_key "users", "roles"
end

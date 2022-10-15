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

ActiveRecord::Schema[7.0].define(version: 2022_10_15_162803) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "nit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gas_station_products", force: :cascade do |t|
    t.integer "price"
    t.bigint "gas_station_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gas_station_id"], name: "index_gas_station_products_on_gas_station_id"
    t.index ["product_id"], name: "index_gas_station_products_on_product_id"
  end

  create_table "gas_stations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "latitud"
    t.string "longitud"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_gas_stations_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "amount"
    t.integer "quantity"
    t.integer "status"
    t.bigint "user_id", null: false
    t.bigint "gas_station_product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gas_station_product_id"], name: "index_purchases_on_gas_station_product_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birthday", null: false
    t.string "address", null: false
    t.string "fuel", null: false
    t.integer "permission_level", default: 0
    t.bigint "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "gas_station_products", "gas_stations"
  add_foreign_key "gas_station_products", "products"
  add_foreign_key "gas_stations", "users"
  add_foreign_key "purchases", "gas_station_products"
  add_foreign_key "purchases", "users"
  add_foreign_key "users", "companies"
end

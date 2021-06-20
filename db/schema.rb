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

ActiveRecord::Schema.define(version: 2021_06_20_210921) do

  create_table "boleto_companions", force: :cascade do |t|
    t.string "bank_code"
    t.string "bank_agency"
    t.string "bank_account"
    t.integer "boleto_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "token"
    t.string "name"
    t.string "cpf"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "cnpj"
    t.string "name"
    t.string "email"
    t.text "address"
    t.string "token"
    t.integer "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_clients", force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_company_clients_on_client_id"
    t.index ["company_id"], name: "index_company_clients_on_company_id"
  end

  create_table "credit_card_companions", force: :cascade do |t|
    t.string "code"
    t.integer "credit_card_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "payment_id", null: false
    t.integer "company_id", null: false
    t.string "token"
    t.index ["company_id"], name: "index_payment_methods_on_company_id"
    t.index ["payment_id"], name: "index_payment_methods_on_payment_id"
  end

  create_table "payment_orders", force: :cascade do |t|
    t.string "token"
    t.string "company_token"
    t.string "payment_method_token"
    t.string "product_token"
    t.string "client_token"
    t.decimal "value"
    t.decimal "discount_value"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "payment_type"
    t.string "description"
    t.decimal "fee"
    t.decimal "max_money_fee"
    t.integer "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pix_companions", force: :cascade do |t|
    t.string "key"
    t.string "bank_code"
    t.integer "pix_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "token"
    t.string "name"
    t.decimal "price"
    t.decimal "discount_pix"
    t.decimal "discount_boleto"
    t.decimal "discount_credit_card"
    t.integer "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "company_clients", "clients"
  add_foreign_key "company_clients", "companies"
  add_foreign_key "payment_methods", "companies"
  add_foreign_key "payment_methods", "payments"
  add_foreign_key "products", "companies"
end

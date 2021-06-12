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

ActiveRecord::Schema.define(version: 2021_06_12_174241) do

  create_table "boleto_companions", force: :cascade do |t|
    t.string "bank_code"
    t.string "bank_agency"
    t.string "bank_account"
    t.integer "boleto_id"
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

  add_foreign_key "payment_methods", "companies"
  add_foreign_key "payment_methods", "payments"
end

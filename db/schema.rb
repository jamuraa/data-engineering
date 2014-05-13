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

ActiveRecord::Schema.define(version: 20140512230241) do

  create_table "import_files", force: true do |t|
    t.string   "name"
    t.datetime "imported_at"
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_purchases", force: true do |t|
    t.integer  "item_id"
    t.integer  "purchaser_id"
    t.integer  "count"
    t.integer  "import_file_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_purchases", ["import_file_id"], name: "index_item_purchases_on_import_file_id"
  add_index "item_purchases", ["item_id"], name: "index_item_purchases_on_item_id"
  add_index "item_purchases", ["purchaser_id"], name: "index_item_purchases_on_purchaser_id"

  create_table "items", force: true do |t|
    t.integer  "merchant_id"
    t.integer  "price_in_cents"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["merchant_id"], name: "index_items_on_merchant_id"

  create_table "merchants", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchasers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

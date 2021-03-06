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

ActiveRecord::Schema.define(version: 2019_03_18_144454) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "collections", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "item_id"], name: "index_collections_on_user_id_and_item_id", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.string "content"
    t.integer "thread_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_comments_on_item_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "seller_id"
    t.string "name"
    t.decimal "price"
    t.string "description"
    t.integer "status"
    t.string "district"
    t.integer "fineness"
    t.integer "method"
    t.integer "field"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_items_on_seller_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "buyer_id"
    t.integer "status"
    t.string "express_number"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "telephone"
    t.index ["buyer_id"], name: "index_orders_on_buyer_id"
    t.index ["item_id"], name: "index_orders_on_item_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "expire_at"
    t.string "token"
    t.string "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_sessions_on_token"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_items", force: :cascade do |t|
    t.integer "item_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_tags_items_on_item_id"
    t.index ["tag_id"], name: "index_tags_items_on_tag_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "handle"
    t.string "password_digest"
    t.string "email"
    t.string "telephone"
    t.string "location"
    t.integer "credit", default: 0
    t.integer "balance", default: 0
    t.string "district"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["handle"], name: "index_users_on_handle", unique: true
    t.index ["telephone"], name: "index_users_on_telephone", unique: true
  end

end

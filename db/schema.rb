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

ActiveRecord::Schema.define(version: 2020_11_12_074844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "board_accesses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "board_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_board_accesses_on_board_id"
    t.index ["user_id", "board_id"], name: "index_board_accesses_on_user_id_and_board_id", unique: true
    t.index ["user_id"], name: "index_board_accesses_on_user_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.string "color", null: false
    t.string "image"
    t.string "custom_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["custom_url"], name: "index_boards_on_custom_url", unique: true
    t.index ["name", "user_id"], name: "index_boards_on_name_and_user_id", unique: true
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "card_tables", force: :cascade do |t|
    t.bigint "board_id", null: false
    t.integer "column_index", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_card_tables_on_board_id"
  end

  create_table "cards", force: :cascade do |t|
    t.bigint "card_table_id", null: false
    t.string "name", null: false
    t.boolean "completed", null: false
    t.text "description"
    t.integer "priority", null: false
    t.datetime "due_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_table_id"], name: "index_cards_on_card_table_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "board_accesses", "boards", on_delete: :cascade
  add_foreign_key "board_accesses", "users", on_delete: :cascade
  add_foreign_key "boards", "users", on_delete: :cascade
  add_foreign_key "card_tables", "boards", on_delete: :cascade
  add_foreign_key "cards", "card_tables", on_delete: :cascade
end

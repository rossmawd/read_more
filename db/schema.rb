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

ActiveRecord::Schema.define(version: 2019_05_09_205432) do

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.text "synopsis"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author"
    t.integer "isbn_13"
    t.string "genre"
    t.text "url", default: "www.google.com"
    t.integer "page_count", default: 0
  end

  create_table "user_books", force: :cascade do |t|
    t.text "review"
    t.integer "rating"
    t.integer "page_number"
    t.string "read_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id"
    t.integer "user_id"
    t.string "possession"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "age"
    t.boolean "found_egg", default: false
  end

end

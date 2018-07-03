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

ActiveRecord::Schema.define(version: 2018_07_02_091519) do

  create_table "albums", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "sharing_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "picture_id"
    t.index ["picture_id"], name: "index_albums_on_picture_id"
  end

  create_table "pictures", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "picture_link"
    t.string "title"
    t.string "description"
    t.string "sharing_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes"
  end

  create_table "relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "username"
    t.string "password"
    t.string "avatar_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "album_id"
    t.index ["album_id"], name: "index_users_on_album_id"
  end

  add_foreign_key "albums", "pictures"
  add_foreign_key "users", "albums"
end

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

ActiveRecord::Schema.define(version: 20151014000755) do

  create_table "challenges", force: :cascade do |t|
    t.datetime "activated_at"
    t.boolean  "private"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "commenter_id"
    t.text     "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "direct_challenges", force: :cascade do |t|
    t.integer  "opponent_id"
    t.integer  "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inbox_messages", force: :cascade do |t|
    t.integer  "inbox_id"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inboxes", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "replier_id"
    t.integer  "repliable_id"
    t.string   "repliable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "replies", ["repliable_type", "repliable_id"], name: "index_replies_on_repliable_type_and_repliable_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.text     "about_me"
    t.string   "avatar"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "ties"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.string   "data_content"
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "voter_id"
    t.integer  "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

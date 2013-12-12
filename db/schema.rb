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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131212035409) do

  create_table "conversations", :force => true do |t|
    t.integer  "initiator_id"
    t.integer  "receiver_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "details", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "last_on"
    t.string   "height"
    t.string   "body_type"
    t.string   "diet"
    t.string   "smokes"
    t.string   "drinks"
    t.string   "drugs"
    t.string   "religion"
    t.string   "sign"
    t.string   "education"
    t.string   "job"
    t.string   "offspring"
    t.string   "pets"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "conversation_id"
    t.string   "body"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id",      :null => false
    t.integer  "age"
    t.string   "gender"
    t.string   "orientation"
    t.string   "location"
    t.string   "summary"
    t.string   "job"
    t.string   "likes"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "max_distance"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "zip",          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",            :null => false
    t.string   "password_digest"
    t.string   "token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end

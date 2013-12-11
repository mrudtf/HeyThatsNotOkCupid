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

ActiveRecord::Schema.define(:version => 20131211201059) do

  create_table "details", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "last_on"
    t.integer  "height"
    t.integer  "body_type"
    t.integer  "diet"
    t.integer  "smokes"
    t.integer  "drinks"
    t.integer  "drugs"
    t.integer  "religion"
    t.integer  "sign"
    t.integer  "education"
    t.integer  "job"
    t.integer  "income"
    t.integer  "offspring"
    t.integer  "pets"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
  end

  create_table "users", :force => true do |t|
    t.string   "name",            :null => false
    t.string   "password_digest"
    t.string   "token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end

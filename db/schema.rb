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

ActiveRecord::Schema.define(:version => 20131215222327) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.string   "body",        :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "conversations", :force => true do |t|
    t.integer  "low_user_id"
    t.integer  "high_user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "conversations", ["high_user_id"], :name => "index_conversations_on_high_user_id"
  add_index "conversations", ["low_user_id", "high_user_id"], :name => "index_conversations_on_low_user_id_and_high_user_id", :unique => true
  add_index "conversations", ["low_user_id"], :name => "index_conversations_on_low_user_id"

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

  create_table "ok_responses", :force => true do |t|
    t.integer  "response_id", :null => false
    t.integer  "answer_id",   :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "ok_responses", ["response_id"], :name => "index_ok_responses_on_response_id"

  create_table "profiles", :force => true do |t|
    t.integer  "user_id",      :null => false
    t.string   "location"
    t.text     "summary"
    t.text     "job"
    t.text     "likes"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "max_distance"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "zip",          :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "body",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "responses", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "question_id", :null => false
    t.integer  "answer_id",   :null => false
    t.integer  "importance",  :null => false
    t.string   "explanation"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "responses", ["user_id", "question_id"], :name => "index_responses_on_user_id_and_question_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name",            :null => false
    t.string   "password_digest"
    t.string   "token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "gender"
    t.string   "orientation"
    t.integer  "age"
  end

  create_table "visits", :force => true do |t|
    t.integer  "visitee_id", :null => false
    t.integer  "visitor_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

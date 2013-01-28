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

ActiveRecord::Schema.define(:version => 20130128202202) do

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "cardnumber"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "provider"
    t.string   "uid"
    t.boolean  "admin"
    t.string   "email"
  end

  create_table "expenses", :force => true do |t|
    t.string   "date"
    t.decimal  "amount",       :precision => 6, :scale => 2
    t.string   "vendor"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.integer  "employee_id"
    t.integer  "statement_id"
    t.string   "receipt_sent"
    t.text     "description"
    t.string   "client"
    t.boolean  "complete",                                   :default => false
    t.string   "splits"
  end

  create_table "statements", :force => true do |t|
    t.string   "closingdate"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "rawstatement_file_name"
    t.string   "rawstatement_content_type"
    t.integer  "rawstatement_file_size"
    t.datetime "rawstatement_updated_at"
  end

end

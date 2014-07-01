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

ActiveRecord::Schema.define(version: 20140701134813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backup", force: true do |t|
    t.string   "storage"
    t.string   "trigger"
    t.string   "adapter"
    t.string   "filename"
    t.string   "path"
    t.string   "bucket"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "identifier"
    t.text     "short_desc"
    t.text     "description"
    t.integer  "decision_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.text     "institution"
    t.text     "intended_use"
    t.boolean  "licence_agreed",           default: false
    t.integer  "licence_id"
    t.integer  "dataset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "non_commercial"
    t.boolean  "understand_collaboration"
  end

  create_table "data_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_categories_datasets", force: true do |t|
    t.integer "dataset_id"
    t.integer "data_category_id"
  end

  create_table "datasets", force: true do |t|
    t.string   "title"
    t.text     "short_desc"
    t.text     "long_desc"
    t.text     "metadata_description"
    t.string   "shp_download"
    t.string   "wms_server"
    t.string   "wfs"
    t.string   "meta_download"
    t.integer  "licence_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "html_file_name"
    t.string   "html_content_type"
    t.integer  "html_file_size"
    t.datetime "html_updated_at"
    t.string   "xml_file_name"
    t.string   "xml_content_type"
    t.integer  "xml_file_size"
    t.datetime "xml_updated_at"
    t.string   "wms_name"
    t.string   "arcgis_link"
    t.integer  "order_number"
    t.boolean  "has_legend"
    t.string   "factsheet_file_name"
    t.string   "factsheet_content_type"
    t.integer  "factsheet_file_size"
    t.datetime "factsheet_updated_at"
    t.datetime "creation_date"
    t.string   "format"
    t.string   "observation_type"
    t.string   "geographical_range"
    t.integer  "time_range_start"
    t.integer  "time_range_end"
    t.string   "data_provider"
    t.string   "styles"
    t.string   "view_params"
  end

  create_table "datasets_decisions", force: true do |t|
    t.integer "dataset_id"
    t.integer "decision_id"
    t.integer "category_id"
  end

  create_table "decisions", force: true do |t|
    t.string   "name"
    t.text     "short_name"
    t.text     "short_desc"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.text     "established"
    t.text     "key_points"
    t.text     "links"
    t.integer  "order_number"
  end

  create_table "licences", force: true do |t|
    t.string   "title"
    t.text     "short_desc"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_links", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

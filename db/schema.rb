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

ActiveRecord::Schema.define(version: 20180228172508) do

  create_table "announcements", force: :cascade do |t|
    t.text     "slide_title"
    t.string   "vimeo"
    t.text     "description"
    t.string   "soundcloud"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "slide_image_file_name"
    t.string   "slide_image_content_type"
    t.integer  "slide_image_file_size"
    t.datetime "slide_image_updated_at"
    t.string   "slug"
    t.integer  "row_order"
    t.string   "fb_image_file_name"
    t.string   "fb_image_content_type"
    t.integer  "fb_image_file_size"
    t.datetime "fb_image_updated_at"
    t.boolean  "slideshow"
    t.text     "slide_title2"
    t.text     "slide_title3"
    t.integer  "Slideshowposition"
    t.string   "platform"
    t.boolean  "newsletter"
    t.integer  "newsletterposition"
    t.string   "hero_file_name"
    t.string   "hero_content_type"
    t.integer  "hero_file_size"
    t.datetime "hero_updated_at"
    t.string   "nltitle"
    t.string   "nlsubtitle"
  end

  add_index "announcements", ["slug"], name: "index_announcements_on_slug", unique: true

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "soundcloud"
    t.string   "fb_url"
    t.string   "twitter_name"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "fb_image_file_name"
    t.string   "fb_image_content_type"
    t.integer  "fb_image_file_size"
    t.datetime "fb_image_updated_at"
    t.integer  "row_order"
    t.string   "slug"
    t.boolean  "slideshow"
    t.string   "slide_image_file_name"
    t.string   "slide_image_content_type"
    t.integer  "slide_image_file_size"
    t.datetime "slide_image_updated_at"
    t.text     "slide_title"
    t.string   "vimeo"
    t.text     "slide_title2"
    t.text     "slide_title3"
    t.integer  "Slideshowposition"
  end

  add_index "artists", ["slug"], name: "index_artists_on_slug", unique: true

  create_table "clogos", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "randombox"
  end

  create_table "compositonlogos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "vimeo_1"
    t.string   "vimeo_2"
    t.string   "vimeo_3"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug"
    t.string   "genre"
    t.integer  "row_order"
    t.string   "soundcloud"
    t.text     "fullqual"
    t.text     "lowqual"
    t.boolean  "display"
    t.integer  "Displayposition"
    t.string   "work_brand_name"
    t.string   "work_campaign_title"
    t.string   "work_brand_name2"
    t.string   "work_campaign_title2"
    t.string   "work_brand_name3"
    t.string   "work_campaign_title3"
    t.string   "platform"
    t.string   "platform2"
    t.string   "platform3"
    t.string   "souncloudtype"
    t.boolean  "randombox"
  end

  add_index "customs", ["slug"], name: "index_customs_on_slug", unique: true

  create_table "customvids", force: :cascade do |t|
    t.string   "vimeo_id"
    t.string   "brand_name"
    t.string   "campaign_title"
    t.integer  "custom_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "customvids", ["custom_id"], name: "index_customvids_on_custom_id"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "newsletters", force: :cascade do |t|
    t.string   "title1"
    t.string   "title2"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "website"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "mainimage_file_name"
    t.string   "mainimage_content_type"
    t.integer  "mainimage_file_size"
    t.datetime "mainimage_updated_at"
    t.string   "downloadlink"
  end

  create_table "releases", force: :cascade do |t|
    t.string   "title"
    t.string   "soundcloud"
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "fb_image_file_name"
    t.string   "fb_image_content_type"
    t.integer  "fb_image_file_size"
    t.datetime "fb_image_updated_at"
    t.integer  "row_order"
    t.string   "slug"
    t.boolean  "slideshow"
    t.string   "slide_image_file_name"
    t.string   "slide_image_content_type"
    t.integer  "slide_image_file_size"
    t.datetime "slide_image_updated_at"
    t.text     "slide_title"
    t.string   "vimeo"
    t.text     "slide_title2"
    t.text     "slide_title3"
    t.integer  "Slideshowposition"
    t.boolean  "newsletter"
    t.integer  "newsletterposition"
    t.string   "downloadlink"
    t.string   "platform"
  end

  add_index "releases", ["slug"], name: "index_releases_on_slug", unique: true

  create_table "researches", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "title"
    t.string   "slug"
    t.integer  "row_order"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "researches", ["slug"], name: "index_researches_on_slug", unique: true

  create_table "showreels", force: :cascade do |t|
    t.text     "description"
    t.string   "work_brand_name"
    t.string   "work_campaign_title"
    t.string   "platform"
    t.string   "vimeo"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "slides", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "works", force: :cascade do |t|
    t.string   "brand_name"
    t.string   "campaign_title"
    t.string   "agency"
    t.string   "track_name"
    t.string   "artist_name"
    t.text     "description"
    t.string   "vimeo"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "fb_image_file_name"
    t.string   "fb_image_content_type"
    t.integer  "fb_image_file_size"
    t.datetime "fb_image_updated_at"
    t.integer  "row_order"
    t.string   "slug"
    t.text     "slide_title"
    t.string   "slide_image_file_name"
    t.string   "slide_image_content_type"
    t.integer  "slide_image_file_size"
    t.datetime "slide_image_updated_at"
    t.boolean  "slideshow"
    t.string   "soundcloud"
    t.text     "slide_title2"
    t.text     "slide_title3"
    t.integer  "Slideshowposition"
    t.string   "platform"
    t.boolean  "newsletter"
    t.integer  "newsletterposition"
    t.string   "hero_file_name"
    t.string   "hero_content_type"
    t.integer  "hero_file_size"
    t.datetime "hero_updated_at"
    t.string   "nltitle"
    t.string   "nlsubtitle"
  end

  add_index "works", ["slug"], name: "index_works_on_slug", unique: true

end

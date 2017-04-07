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

ActiveRecord::Schema.define(version: 20170404142244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arxiu_correctius", force: :cascade do |t|
    t.integer  "edifici_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "xml_correctiu_file_name"
    t.string   "xml_correctiu_content_type"
    t.integer  "xml_correctiu_file_size"
    t.datetime "xml_correctiu_updated_at"
  end

  create_table "arxiu_millores", force: :cascade do |t|
    t.integer  "edifici_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "xml_millora_file_name"
    t.string   "xml_millora_content_type"
    t.integer  "xml_millora_file_size"
    t.datetime "xml_millora_updated_at"
  end

  create_table "arxiu_preventius", force: :cascade do |t|
    t.integer  "edifici_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "xml_preventiu_file_name"
    t.string   "xml_preventiu_content_type"
    t.integer  "xml_preventiu_file_size"
    t.datetime "xml_preventiu_updated_at"
  end

  create_table "despeses", force: :cascade do |t|
    t.integer  "edifici_id"
    t.integer  "fase_id"
    t.string   "concepte"
    t.integer  "import"
    t.integer  "data_mes"
    t.integer  "data_any"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "edificis", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nom_edifici"
    t.string   "ref_cadastral"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "fases", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom"
    t.integer  "posicio"
    t.text     "observacions"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "identificacions", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "tipus_via"
    t.string   "nom_via"
    t.string   "numero_via"
    t.string   "bloc"
    t.integer  "codi_postal"
    t.string   "poblacio"
    t.string   "provincia"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "foto_facana_file_name"
    t.string   "foto_facana_content_type"
    t.integer  "foto_facana_file_size"
    t.datetime "foto_facana_updated_at"
  end

  create_table "ingressos", force: :cascade do |t|
    t.integer  "edifici_id"
    t.integer  "import"
    t.integer  "data_mes"
    t.integer  "data_any"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operacions", force: :cascade do |t|
    t.integer  "edifici_id"
    t.integer  "fase_id"
    t.text     "descripcio_ca"
    t.text     "descripcio_es"
    t.decimal  "periodicitat"
    t.string   "periodicitat_text_ca"
    t.string   "periodicitat_text_es"
    t.string   "tipus"
    t.string   "sistema"
    t.integer  "import_obres"
    t.integer  "import_honoraris"
    t.integer  "import_taxes"
    t.integer  "import_altres"
    t.integer  "import_total"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "planificacions", force: :cascade do |t|
    t.integer  "edifici_id"
    t.integer  "fons_propis"
    t.integer  "subvencions_solicitades"
    t.integer  "subvencions_atorgades"
    t.integer  "import_financar"
    t.string   "forma_financar"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "preventius", force: :cascade do |t|
    t.integer  "edifici_id"
    t.text     "descripcio_ca"
    t.text     "descripcio_es"
    t.decimal  "periodicitat"
    t.string   "periodicitat_text_ca"
    t.string   "periodicitat_text_es"
    t.string   "document_referencia"
    t.string   "responsable_ca"
    t.string   "responsable_es"
    t.boolean  "obligatorietat"
    t.boolean  "manual_habitatge"
    t.boolean  "creat_usuari"
    t.string   "sistema"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "tresoreries", force: :cascade do |t|
    t.integer  "edifici_id"
    t.integer  "import"
    t.integer  "data_mes"
    t.integer  "data_any"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role",                   default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end

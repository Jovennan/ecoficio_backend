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

ActiveRecord::Schema.define(version: 2018_08_18_094737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departamentos", force: :cascade do |t|
    t.string "nome"
    t.bigint "orgao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orgao_id"], name: "index_departamentos_on_orgao_id"
  end

  create_table "documentos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.string "titulo"
    t.string "brasao"
    t.bigint "autor_id"
    t.bigint "orgao_id"
    t.string "visibilidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autor_id"], name: "index_documentos_on_autor_id"
    t.index ["orgao_id"], name: "index_documentos_on_orgao_id"
  end

  create_table "orgaos", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.bigint "chefe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chefe_id"], name: "index_orgaos_on_chefe_id"
  end

  create_table "papels", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "papels_permissaos", id: false, force: :cascade do |t|
    t.bigint "permissao_id", null: false
    t.bigint "papel_id", null: false
    t.index ["papel_id", "permissao_id"], name: "index_papels_permissaos_on_papel_id_and_permissao_id"
  end

  create_table "papels_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "papel_id", null: false
  end

  create_table "permissaos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "departamentos", "orgaos"
  add_foreign_key "documentos", "orgaos"
end

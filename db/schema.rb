# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_26_190828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "caixas", force: :cascade do |t|
    t.bigint "pedido_id"
    t.integer "tipo"
    t.integer "situacao"
    t.decimal "valor"
    t.date "data"
    t.datetime "data_baixa"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "fornecedor_id"
    t.date "data_estorno"
    t.index ["fornecedor_id"], name: "index_caixas_on_fornecedor_id"
    t.index ["pedido_id"], name: "index_caixas_on_pedido_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "endereco_clientes", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.string "logradouro"
    t.string "numero"
    t.string "bairro"
    t.string "cidade"
    t.string "complemento"
    t.string "cep"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_endereco_clientes_on_cliente_id"
  end

  create_table "fornecedores", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pedido_itens", force: :cascade do |t|
    t.bigint "pedido_id", null: false
    t.bigint "produto_id", null: false
    t.float "quantidade"
    t.decimal "valor_unitario"
    t.decimal "valor_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pedido_id"], name: "index_pedido_itens_on_pedido_id"
    t.index ["produto_id"], name: "index_pedido_itens_on_produto_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.integer "situacao"
    t.integer "prazo_entrega"
    t.date "data_entrega"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "data", null: false
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "descricao"
    t.decimal "preco"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "caixas", "fornecedores"
  add_foreign_key "caixas", "pedidos"
  add_foreign_key "endereco_clientes", "clientes"
  add_foreign_key "pedido_itens", "pedidos"
  add_foreign_key "pedido_itens", "produtos"
  add_foreign_key "pedidos", "clientes"
end

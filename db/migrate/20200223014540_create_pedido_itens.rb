class CreatePedidoItens < ActiveRecord::Migration[6.0]
  def change
    create_table :pedido_itens do |t|
      t.references :pedido, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.float :quantidade
      t.decimal :valor_unitario
      t.decimal :valor_total

      t.timestamps
    end
  end
end

class CreatePedidos < ActiveRecord::Migration[6.0]
  def change
    create_table :pedidos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.integer :situacao
      t.integer :prazo_entrega
      t.date :data_entrega

      t.timestamps
    end
  end
end

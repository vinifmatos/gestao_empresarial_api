class CreateCaixas < ActiveRecord::Migration[6.0]
  def change
    create_table :caixas do |t|
      t.references :pedido, null: false, foreign_key: true
      t.integer :tipo
      t.integer :situacao
      t.decimal :valor
      t.date :data
      t.datetime :data_baixa

      t.timestamps
    end
  end
end

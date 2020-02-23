class CreateEnderecoClientes < ActiveRecord::Migration[6.0]
  def change
    create_table :endereco_clientes do |t|
      t.references :cliente, null: false, foreign_key: true
      t.string :logradouro
      t.string :numero
      t.string :bairro
      t.string :cidade
      t.string :complemento
      t.string :cep

      t.timestamps
    end
  end
end

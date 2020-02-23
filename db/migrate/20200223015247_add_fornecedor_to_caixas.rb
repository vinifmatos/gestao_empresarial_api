class AddFornecedorToCaixas < ActiveRecord::Migration[6.0]
  def change
    add_reference :caixas, :fornecedor, null: false, foreign_key: true
  end
end

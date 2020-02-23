# frozen_string_literal: true

class AddFornecedorToCaixas < ActiveRecord::Migration[6.0]
  def change
    add_reference :caixas, :fornecedor, foreign_key: true
  end
end

# frozen_string_literal: true

class AddDataToPedidos < ActiveRecord::Migration[6.0]
  def change
    add_column :pedidos, :data, :date, null: false
  end
end

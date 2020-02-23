class AddDataEstornoToCaixas < ActiveRecord::Migration[6.0]
  def change
    add_column :caixas, :data_estorno, :date
  end
end

class AddRowOrderToContents < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :row_order, :integer
  end
end

class AddMemoToContents < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :memo, :string
  end
end

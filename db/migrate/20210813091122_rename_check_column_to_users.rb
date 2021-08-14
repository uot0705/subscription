class RenameCheckColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :check, :check_id
  end
end

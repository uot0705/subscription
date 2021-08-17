class RenameCheckIdColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :check_id, :check
  end
end

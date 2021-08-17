class ChangeDataCheckToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :check, :string
  end
end

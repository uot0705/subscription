class RemoveAuthorFromContents < ActiveRecord::Migration[6.0]
  def change
    remove_column :contents, :position, :integer
  end
end

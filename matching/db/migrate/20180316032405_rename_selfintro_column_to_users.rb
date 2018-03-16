class RenameSelfintroColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :selfintro, :prof
  end
end

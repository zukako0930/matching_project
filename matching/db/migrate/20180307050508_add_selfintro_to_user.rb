class AddSelfintroToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :selfintro, :text
  end
end

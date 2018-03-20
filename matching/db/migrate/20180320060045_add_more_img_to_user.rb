class AddMoreImgToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image2, :string
    add_column :users, :image3, :string
    add_column :users, :image4, :string
  end
end

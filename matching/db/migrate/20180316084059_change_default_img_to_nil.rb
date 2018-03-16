class ChangeDefaultImgToNil < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :image, :string, default: nil
  end
end

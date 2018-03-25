class CreateBlockLists < ActiveRecord::Migration[5.1]
  def change
    create_table :block_lists do |t|
      t.integer :blocked_by
      t.integer :blocked

      t.timestamps
    end
  end
end

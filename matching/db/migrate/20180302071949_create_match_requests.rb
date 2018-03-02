class CreateMatchRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :match_requests do |t|
      t.string :request_user_id
      t.string :integer
      t.string :target_user_id
      t.string :integer

      t.timestamps
    end
  end
end

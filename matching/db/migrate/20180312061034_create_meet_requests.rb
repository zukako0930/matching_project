class CreateMeetRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :meet_requests do |t|
      t.integer :request_user_id
      t.integer :target_user_id

      t.timestamps
    end
  end
end

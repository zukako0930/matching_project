class RenameMeetRequest < ActiveRecord::Migration[5.1]
  def change
    rename_column :meet_requests, :request_user_id, :meet_request_user_id
    rename_column :meet_requests, :target_user_id, :meet_target_user_id
  end
end

class CreateDateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :date_schedules do |t|
      t.integer :date_sug_user_id
      t.integer :date_tar_user_id
      t.datetime :date_of_meet
      t.boolean :confirm

      t.timestamps
    end
  end
end

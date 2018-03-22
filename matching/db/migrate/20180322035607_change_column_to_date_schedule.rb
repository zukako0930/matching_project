class ChangeColumnToDateSchedule < ActiveRecord::Migration[5.1]
  def change
    change_column :date_schedules, :confirm, :boolean, null: false, default: false
  end

end

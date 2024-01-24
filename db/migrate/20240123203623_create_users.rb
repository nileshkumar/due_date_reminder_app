class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.boolean :activate_reminders
      t.integer :due_date_reminder_interval
      t.integer :due_date_reminder_option
      t.time :due_date_reminder_time
      t.string :time_zone

      t.timestamps
    end
  end
end

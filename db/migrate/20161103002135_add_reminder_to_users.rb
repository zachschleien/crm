class AddReminderToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email_reminder, :boolean, default: true
  end
end

class AddHistoryToConversations < ActiveRecord::Migration[5.0]
  def change
    add_column :conversations, :history, :boolean, default: false
  end
end

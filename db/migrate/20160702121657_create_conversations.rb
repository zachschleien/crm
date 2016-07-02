class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.references :contact, foreign_key: true
      t.text :topic
      t.string :contact_method
      t.text :next_step
      t.datetime :last_contacted
      t.datetime :follow_up_date
      t.boolean :conversation_completed

      t.timestamps
    end
  end
end

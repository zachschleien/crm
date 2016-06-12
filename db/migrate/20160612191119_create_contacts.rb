class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :status
      t.string :method
      t.text :action_items
      t.datetime :conversation_date
      t.datetime :follow_up_date

      t.timestamps
    end
  end
end

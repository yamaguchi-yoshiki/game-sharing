class CreateThreadMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :thread_messages do |t|
      t.integer :customer_id
      t.integer :thread_id
      t.text :message

      t.timestamps
    end
  end
end

class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id
      t.integer :game_id
      t.integer :rate, default: 0, null: false
      t.text :comment
      t.boolean :is_public, default: false, null: false

      t.timestamps
    end
  end
end

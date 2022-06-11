class CreateSympathies < ActiveRecord::Migration[6.1]
  def change
    create_table :sympathies do |t|
      t.integer :customer_id
      t.integer :review_id

      t.timestamps
    end
  end
end

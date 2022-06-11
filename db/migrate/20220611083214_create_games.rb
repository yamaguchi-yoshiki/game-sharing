class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :platform_id
      t.string :title
      t.text :introduction
      t.string :release_date
      t.integer :no_tax_price
      t.string :related_url

      t.timestamps
    end
  end
end

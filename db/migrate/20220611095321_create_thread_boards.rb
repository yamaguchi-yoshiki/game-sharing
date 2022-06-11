class CreateThreadBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :thread_boards do |t|
      t.integer :game_id
      t.string :title
      t.text :introduction
      t.boolean :no_spoiler, default: true, null: false

      t.timestamps
    end
  end
end

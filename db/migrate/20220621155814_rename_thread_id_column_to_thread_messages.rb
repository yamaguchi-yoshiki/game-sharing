class RenameThreadIdColumnToThreadMessages < ActiveRecord::Migration[6.1]
  def change
    rename_column :thread_messages, :thread_id, :thread_board_id
  end
end

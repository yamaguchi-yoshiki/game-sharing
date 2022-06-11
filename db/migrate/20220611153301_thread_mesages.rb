class ThreadMesages < ActiveRecord::Migration[6.1]
  def change
    drop_table :thread_messages
  end
end

class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :title
      t.boolean :is_completed
      t.datetime :completed_at

      t.timestamps
    end
  end
end

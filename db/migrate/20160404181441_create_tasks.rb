class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :body, limit: 300, null: false
      t.boolean :status, default: false, null: false
      t.integer :position, null: false

      t.timestamps null: false
    end
  end
end

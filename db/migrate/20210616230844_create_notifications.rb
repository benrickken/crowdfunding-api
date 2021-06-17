class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.text :body
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

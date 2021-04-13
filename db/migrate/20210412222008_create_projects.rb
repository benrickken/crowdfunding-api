class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :target_amount
      t.date :due_date
      t.text :description

      t.timestamps
    end
  end
end

class CreateProjectReturns < ActiveRecord::Migration[6.1]
  def change
    create_table :project_returns do |t|
      t.references :project, null: false, foreign_key: true
      t.integer :price
      t.integer :capacity
      t.date :delivery_date
      t.text :description

      t.timestamps
    end
  end
end

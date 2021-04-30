class CreateProjectSupports < ActiveRecord::Migration[6.1]
  def change
    create_table :project_supports do |t|
      t.references :project_return, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps

      t.index [:project_return_id, :user_id], unique: true
    end
  end
end

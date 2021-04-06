class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :uid

      t.timestamps
    end
    add_index :users, :uid, unique: true
  end
end

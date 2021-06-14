class AddCompletedAtToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :completed_at, :datetime
  end
end

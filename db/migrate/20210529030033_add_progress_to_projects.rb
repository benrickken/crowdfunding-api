class AddProgressToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :progress, :integer, default: 0
  end
end

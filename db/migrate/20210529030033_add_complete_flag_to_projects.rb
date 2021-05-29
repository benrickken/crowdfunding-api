class AddCompleteFlagToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :complete_flag, :boolean, default: false
  end
end

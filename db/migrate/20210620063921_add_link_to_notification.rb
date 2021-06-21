class AddLinkToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :link, :string
  end
end

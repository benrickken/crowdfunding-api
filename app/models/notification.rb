class Notification < ApplicationRecord
  belongs_to :user

  validates :body, presence: true
  validates :status, presence: true

  enum status: { unread: 0, read: 1 }
end

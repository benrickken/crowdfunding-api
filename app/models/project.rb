class Project < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :target_amount, presence: true
  validates :due_date, presence: true
end

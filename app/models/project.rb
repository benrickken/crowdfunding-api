class Project < ApplicationRecord
  belongs_to :user
  has_many :project_returns
  has_many :project_supports, through: :project_returns

  validates :title, presence: true
  validates :target_amount, presence: true
  validates :due_date, presence: true

  def supported_amount
    project_supports.sum do |project_support|
      project_support.project_return.price
    end
  end
end

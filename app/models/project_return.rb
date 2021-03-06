class ProjectReturn < ApplicationRecord
  belongs_to :project
  has_many :project_supports

  validates :project, presence: true
  validates :price, presence: true
  validates :capacity, presence: true
  validates :delivery_date, presence: true
  validates :description, presence: true

  def supported_by?(user)
    project_supports.exists?(user: user)
  end
end

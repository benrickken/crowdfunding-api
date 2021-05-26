class ProjectReturn < ApplicationRecord
  belongs_to :project
  has_many :project_supports

  validates :project, presence: true
  validates :price, presence: true
  validates :capacity, presence: true
  validates :delivery_date, presence: true
  validates :description, presence: true

  def created_by?(user)
    return false unless user

    project.user.try(:id) == user.id
  end

  def supported_by?(user)
    return false unless user

    project_supports.exists?(user: user)
  end
end

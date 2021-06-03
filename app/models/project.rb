class Project < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_many :project_returns
  has_many :project_supports, through: :project_returns

  has_one_attached :image

  accepts_nested_attributes_for :project_returns

  validates :user_id, presence: true
  validates :title, presence: true
  validates :target_amount, presence: true
  validates :due_date, presence: true

  def image_url
    image.attached? ? url_for(image) : nil
  end

  def supported_amount
    project_supports.includes(:project_return).sum('project_returns.price')
  end

  def created_by?(user)
    user_id == user&.id
  end
end

class Project < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_many :project_returns
  has_many :project_supports, through: :project_returns
  has_many :comments
  has_many :favorites

  has_one_attached :image

  accepts_nested_attributes_for :project_returns

  validates :user_id, presence: true
  validates :title, presence: true
  validates :target_amount, presence: true
  validates :due_date, presence: true
  validates :progress, presence: true

  scope :completed_yesterday, -> { where(completed_at: 1.day.ago.beginning_of_day..1.day.ago.end_of_day) }

  enum progress: { incomplete: 0, completed: 1 }

  def image_url
    image.attached? ? url_for(image) : nil
  end

  def supported_amount
    project_supports.includes(:project_return).sum('project_returns.price')
  end

  def created_by?(user)
    user_id == user&.id
  end

  def update_if_complete!
    update!(progress: :completed, completed_at: Time.zone.now) if supported_amount >= target_amount
  end

  def self.query_for_serializer
    includes(:user, { image_attachment: :blob })
      .left_joins({ project_returns: :project_supports })
      .group('projects.id')
      .select(
        'projects.*,'\
        '(SELECT count(favorites.id) FROM favorites WHERE project_id = projects.id) AS favorites_count,'\
        'SUM(CASE WHEN project_supports.id IS NOT NULL THEN project_returns.price END) AS project_supports_total_price,'\
        'COUNT(project_supports.id) AS project_supports_count'\
      )
  end
end

class ProjectSupport < ApplicationRecord
  belongs_to :project_return
  belongs_to :user

  validates :project_return_id, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
end

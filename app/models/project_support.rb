class ProjectSupport < ApplicationRecord
  belongs_to :project_return
  belongs_to :user

  validates :project_return_id, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true

  def self.create_and_update_project_progress!(user:, params:)
    project_support = user.project_supports.new(params)

    ActiveRecord::Base.transaction do
      project_support.save!
      project = project_support.project_return.project
      project.completed! if project.supported_amount >= project.target_amount
    end

    project_support
  end
end

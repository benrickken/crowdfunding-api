class ProjectSupport < ApplicationRecord
  belongs_to :project_return
  belongs_to :user

  validates :project_return_id, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true

  def self.create_with_complete_check!(user:, params:)
    project_support = user.project_supports.new(params)

    ActiveRecord::Base.transaction do
      project_support.save!
      project = project_support.project_return.project
      project.update_if_complete!
    end

    project_support
  end
end

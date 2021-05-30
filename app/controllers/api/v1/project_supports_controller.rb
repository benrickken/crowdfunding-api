class Api::V1::ProjectSupportsController < ApplicationController
  before_action :authenticate_user!

  def create
    project_support = current_user.project_supports.new(project_support_params)

    ActiveRecord::Base.transaction do
      project_support.save!
      project = project_support.project_return.project
      project.completed! if project.supported_amount >= project.target_amount
    end

    render json: { project_support: project_support }
  rescue StandardError => e
    render json: e, status: :unprocessable_entity
  end

  private

  def project_support_params
    params.require(:project_support).permit(:project_return_id)
  end
end

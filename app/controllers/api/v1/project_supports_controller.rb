class Api::V1::ProjectSupportsController < ApplicationController
  before_action :authenticate_user!

  def create
    project_support = ProjectSupport.create_and_update_project_progress!(user: current_user, params: project_support_params)

    render json: { project_support: project_support }
  rescue StandardError => e
    render json: e, status: :unprocessable_entity
  end

  private

  def project_support_params
    params.require(:project_support).permit(:project_return_id)
  end
end

class Api::V1::ProjectSupportsController < Api::V1::BaseController
  before_action :authenticate_user!

  def create
    project_support = ProjectSupport.create_with_complete_check!(user: current_user, params: project_support_params)

    render json: { project_support: project_support }
  end

  private

  def project_support_params
    params.require(:project_support).permit(:project_return_id)
  end
end

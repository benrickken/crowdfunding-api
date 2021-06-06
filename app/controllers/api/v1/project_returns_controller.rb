class Api::V1::ProjectReturnsController < Api::V1::BaseController
  def index
    project = Project.find(params[:id])
    project_returns = project.project_returns

    render json: {
      projectReturns: project_returns.map do |project_return|
                        ProjectReturnSerializer.new(project_return: project_return, user: current_user).as_json
                      end
    }
  end
end

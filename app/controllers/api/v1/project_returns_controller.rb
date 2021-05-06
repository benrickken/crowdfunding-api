class Api::V1::ProjectReturnsController < ApplicationController
  def index
    project = Project.find(params[:id])
    project_returns = project.project_returns
    render json: {
      projectReturns: project_returns.map { |project_return| ProjectReturnSerializer.new(project_return: project_return).as_json }
    }
  end
end

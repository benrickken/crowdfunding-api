class Api::V1::ProjectsController < Api::V1::BaseController
  before_action :authenticate_user!, only: [:create]

  def index
    projects = Project.aggregate_with_counts.order(created_at: :desc)
    render json: {
      projects: projects.map { |project| ProjectSerializer.new(project: project).as_json }
    }
  end

  def show
    project = Project.aggregate_with_counts.find(params[:id])
    render json: {
      project: ProjectSerializer.new(project: project).as_json
    }
  end

  def create
    project = current_user.projects.new(project_params)

    if project.save
      render json: { project: project }
    else
      render json: project.errors.messages, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :image, :target_amount, :due_date, :description, project_returns_attributes: %i[price capacity delivery_date description])
  end
end

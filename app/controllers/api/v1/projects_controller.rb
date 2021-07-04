class Api::V1::ProjectsController < Api::V1::BaseController
  before_action :authenticate_user!, only: [:create]

  def index
    projects = Project.order(created_at: :desc)
                      .includes(:user, { image_attachment: :blob })
                      .left_joins(:favorites, { project_supports: :project_return })
                      .group('projects.id')
                      .select('projects.*, SUM(project_returns_project_supports.price) as total_supported_amount, COUNT(project_supports.id) as project_supports_count, COUNT(favorites.id) as favorites_count')

    render json: {
      projects: projects.map { |project| ProjectSerializer.new(project: project).as_json }
    }
  end

  def show
    project = Project.find(params[:id])
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

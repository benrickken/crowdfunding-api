class Api::V1::ProjectsController < ApplicationController
  before_action :set_auth, only: [:create]

  def index
    projects = Project.order(created_at: :desc).includes(:user)
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
    render json: @auth, status: :unauthorized and return unless @auth[:data]

    uid = @auth[:data]['uid']
    user = User.find_by(uid: uid)
    render json: { message: 'User does not exist' }, status: :bad_request and return if user.blank?

    project = user.projects.new(project_params)

    if project.save
      render json: { project: project }
    else
      render json: project.errors.messages, status: :unprocessable_entity
    end
  end

  private

  def set_auth
    @auth = authenticate_token_by_firebase
  end

  def project_params
    params.require(:project).permit(:title, :image, :target_amount, :due_date, :description, project_returns_attributes: %i[price capacity delivery_date description])
  end
end

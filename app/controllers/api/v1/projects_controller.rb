class Api::V1::ProjectsController < ApplicationController
  before_action :set_auth, only: [:create]

  def index
    projects = Project.order(created_at: :desc)
    render json: { projects: projects }
  end

  def create
    render json: @auth, status: :unauthorized and return unless @auth[:data]

    uid = @auth[:data]['uid']
    puts uid
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
    params.require(:project).permit(:title, :target_amount, :due_date, :description)
  end
end

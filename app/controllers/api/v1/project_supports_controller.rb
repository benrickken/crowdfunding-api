class Api::V1::ProjectSupportsController < ApplicationController
  before_action :set_auth, only: [:create]

  def create
    render json: @auth, status: :unauthorized and return unless @auth[:data]

    uid = @auth[:data]['uid']
    user = User.find_by(uid: uid)
    render json: { message: 'User does not exist' }, status: :bad_request and return if user.blank?    

    project_support = user.project_supports.new(project_support_params)

    if project_support.save
      render json: { project_support: project_support }
    else
      render json: project_support.errors.messages, status: :unprocessable_entity
    end
  end

  private
  
  def set_auth
    @auth = authenticate_token_by_firebase
  end

  def project_support_params
    params.require(:project_support).permit(:project_return_id)
  end
end

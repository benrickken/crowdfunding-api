class Api::V1::ProjectReturnsController < ApplicationController
  before_action :set_auth, only: [:index]

  def index
    project = Project.find(params[:id])
    project_returns = project.project_returns
    uid = @auth[:data] && @auth[:data]['uid']
    user = User.find_by(uid: uid)

    render json: {
      projectReturns: project_returns.map do |project_return|
                        ProjectReturnSerializer.new(project_return: project_return, user: user).as_json
                      end
    }
  end

  private

  def set_auth
    @auth = authenticate_token_by_firebase
  end
end

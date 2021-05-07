class Api::V1::MesController < ApplicationController
  before_action :set_auth

  def show
    render json: @auth, status: :unauthorized and return unless @auth[:data]

    uid = @auth[:data]['uid']
    user = User.find_by(uid: uid)

    render json: { message: 'Could not find user.' }, status: :unauthorized and return unless user

    render json: UserSerializer.new(user: user).as_json
  end

  def projects
    render json: @auth, status: :unauthorized and return unless @auth[:data]

    uid = @auth[:data]['uid']
    user = User.find_by(uid: uid)

    render json: { message: 'Could not find user.' }, status: :unauthorized and return unless user

    render json: {
      projects: user.projects.map { |project| ProjectSerializer.new(project: project).as_json }
    }
  end

  private

  def set_auth
    @auth = authenticate_token_by_firebase
  end
end

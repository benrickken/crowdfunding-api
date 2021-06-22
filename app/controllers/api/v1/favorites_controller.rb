class Api::V1::FavoritesController < Api::V1::BaseController
  before_action :authenticate_user!, only: %i[show create destroy]
  before_action :set_project, only: %i[show create destroy]

  def show
    favorite = @project.favorites.find_by(user: current_user)
    render json: { favorite: favorite ? FavoriteSerializer.new(favorite: favorite).as_json : nil }
  end

  def create
    @project.favorites.create!(user: current_user)
    head :ok
  end

  def destroy
    @project.favorites.find_by(user: current_user).destroy!
    head :ok
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end

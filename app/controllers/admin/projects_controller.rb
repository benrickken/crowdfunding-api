class Admin::ProjectsController < Admin::BaseController
  def index
    @q = Project.includes(:user).ransack(params[:q])
    @projects = @q.result
  end
end

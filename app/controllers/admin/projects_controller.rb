class Admin::ProjectsController < Admin::BaseController
  def index
    @projects = Project.all.includes(:user)
  end
end

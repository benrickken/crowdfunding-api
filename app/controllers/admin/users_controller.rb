class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @projects = Project.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to [:admin, @user], notice: 'user was successfully updated.'
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(project_ids: [])
  end
end

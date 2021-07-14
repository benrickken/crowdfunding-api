class Admin::ProjectsController < Admin::BaseController
  def index
    @q = Project.includes(:user).ransack(params[:q])
    @projects = @q.result
  end

  def new_from_csv
    @errors = []
  end

  def create_from_csv
    unless params[:csv_file] && params[:csv_file].content_type == 'text/csv'
      @errors = ['正しいファイル形式のファイルがアップロードされていません。CSV形式のファイルをアップロードしてください。']
      return render :new_from_csv
    end

    @errors = Project.import_projects_from_csv(params[:csv_file])
    if @errors.empty?
      redirect_to admin_projects_path
    else
      render :new_from_csv
    end
  end
end

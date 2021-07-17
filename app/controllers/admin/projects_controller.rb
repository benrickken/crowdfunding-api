class Admin::ProjectsController < Admin::BaseController
  def index
    @q = Project.includes(:user).ransack(params[:q])
    @projects = @q.result
  end

  def new_from_csv
    @project_upload_form = ProjectUploadForm.new
  end

  def create_from_csv
    @project_upload_form = ProjectUploadForm.new(project_upload_form_params)
    if @project_upload_form.save
      redirect_to admin_projects_path, notice: 'Contact was successfully submitted.'
    else
      render :new_from_csv
    end
  end

  private

  def project_upload_form_params
    params.fetch(:project_upload_form, {}).permit(:csv_file)
  end
end

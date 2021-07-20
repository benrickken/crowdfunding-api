class Admin::ProjectUploadsController < Admin::BaseController
  def new
    @project_upload_form = ProjectUploadForm.new
  end

  def create
    @project_upload_form = ProjectUploadForm.new(project_upload_form_params)
    if @project_upload_form.save
      redirect_to admin_projects_path, notice: 'Project Upload was successfully submitted.'
    else
      render :new
    end
  end

  private

  def project_upload_form_params
    params.fetch(:project_upload_form, {}).permit(:csv_file)
  end
end

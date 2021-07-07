class Admin::ContactsController < Admin::BaseController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(contact_form_params)
    if @contact_form.save
      redirect_to admin_projects_path, notice: 'Contact was successfully submitted.'
    else
      render :new
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:title, :body, :email)
  end
end

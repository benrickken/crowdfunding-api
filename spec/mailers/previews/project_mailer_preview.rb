class ProjectMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3001/rails/mailers/project_mailer/completion_email
  def completion_email
    ProjectMailer.with(project: Project.first).completion_email
  end
end

class ProjectMailerJob < ApplicationJob
  queue_as :mailer

  def perform(project_id)
    project = Project.find(project_id)
    ProjectMailer.with(project: project).completion_email.deliver_now
  end
end

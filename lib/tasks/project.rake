namespace :project do
  desc 'Task to send project completion mail to project owners at 7AM on the following day.'
  task send_project_completion_mail: :environment do
    Project.completed_yesterday.find_each do |project|
      ProjectMailerJob.perform_later(project.id)
    end
  end
end

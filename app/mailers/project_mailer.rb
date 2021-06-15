class ProjectMailer < ApplicationMailer
  def completion_email
    @project = params[:project]

    mail(to: @project.user.email, subject: 'プロジェクトが目標金額に到達しました。')
  end
end

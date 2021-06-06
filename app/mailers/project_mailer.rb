class ProjectMailer < ApplicationMailer
  def completion_email
    @project = params[:project]

    mail(to: 'benrickken@gmail.com', subject: 'プロジェクトが目標金額に到達しました。')
  end
end

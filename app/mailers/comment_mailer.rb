class CommentMailer < ApplicationMailer
  def new_comment_email
    @comment = params[:comment]
    @project = @comment.project

    mail(to: @project.user.email, subject: 'プロジェクトに新しいコメントがあります。')
  end
end

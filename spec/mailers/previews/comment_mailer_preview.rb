class CommentMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3001/rails/mailers/comment_mailer/new_comment_email
  def new_comment_email
    CommentMailer.with(comment: Comment.first).new_comment_email
  end
end

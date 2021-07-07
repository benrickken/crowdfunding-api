class AdminContactMailer < ApplicationMailer
  def new_contact_email
    @title = params[:title]
    @body = params[:body]
    @email = params[:email]

    mail(to: 'benrickken@gmail.com', subject: '新しいお問合わせが届いています。')
  end
end

class AdminContactMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3001/rails/mailers/admin_contact_mailer/new_contact_email
  def new_contact_email
    AdminContactMailer.with(title: 'お問い合わせ', body: 'お問い合わせです', email: 'benrickken@gmail.com').new_contact_email
  end
end

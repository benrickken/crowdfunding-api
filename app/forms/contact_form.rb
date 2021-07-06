class ContactForm
  include ActiveModel::Model

  attr_accessor :title, :body, :email

  validates :title, :body, :email, presence: true

  def submit
    return false if invalid?

    AdminContactMailer.with(title: title, body: body, email: email).new_contact_email.deliver_later
  end
end

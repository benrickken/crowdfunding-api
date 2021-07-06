class ContactForm
  include ActiveModel::Model

  attr_accessor :title, :body, :email

  validates :title, :body, :email, presence: true

  def submit
    return false if invalid?

    true
  end
end

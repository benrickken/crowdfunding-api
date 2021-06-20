class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :body, presence: true, length: { maximum: 100 }

  def self.create_with_notification(user:, project:, params:)
    comment = user.comments.new(params)
    comment.project = project

    return comment unless comment.valid?

    ActiveRecord::Base.transaction do
      comment.save!
      Notification.create!(
        user: project.user,
        body: "「#{project.title}」に新しいコメントが届いています。",
        status: :unread,
        link: "/projects/#{project.id}"
      )
      comment
    end
  end
end

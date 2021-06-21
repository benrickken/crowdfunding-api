class NotificationSerializer
  def initialize(notification:)
    @notification = notification
  end

  def as_json
    {
      id: @notification.id,
      body: @notification.body,
      status: @notification.status,
      link: @notification.link,
      createdAt: @notification.created_at
    }
  end
end

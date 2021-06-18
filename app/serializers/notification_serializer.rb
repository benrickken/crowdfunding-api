class NotificationSerializer
  def initialize(notification:)
    @notification = notification
  end

  def as_json
    {
      id: @notification.id,
      body: @notification.body,
      status: @notification.status,
      createdAt: @notification.created_at
    }
  end
end

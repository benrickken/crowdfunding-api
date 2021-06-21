class UserSerializer
  def initialize(user:)
    @user = user
  end

  def as_json
    {
      id: @user.id,
      name: @user.name,
      unreadNotificationsCount: @user.notifications.unread.count
    }
  end
end

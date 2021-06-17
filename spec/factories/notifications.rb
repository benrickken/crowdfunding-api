FactoryBot.define do
  factory :notification do
    user
    body { 'My Notification' }
    status { :unread }
  end
end

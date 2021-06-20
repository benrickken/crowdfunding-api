FactoryBot.define do
  factory :notification do
    user
    body { 'My Notification' }
    status { :unread }
    link { '/projects/1' }
  end
end

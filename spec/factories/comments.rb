FactoryBot.define do
  factory :comment do
    association :project, strategy: :create
    association :user, strategy: :create
    body { 'My Comment' }
  end
end

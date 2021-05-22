FactoryBot.define do
  factory :project_support do
    association :project_return, strategy: :create
    association :user, strategy: :create
  end
end

FactoryBot.define do
  factory :comment do
    project
    user
    body { 'My Comment' }
  end
end

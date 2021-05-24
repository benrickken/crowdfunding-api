FactoryBot.define do
  factory :user do
    uid { SecureRandom.uuid }
    name { 'Ben Rickken' }
  end
end

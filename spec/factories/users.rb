FactoryBot.define do
  factory :user do
    uid { SecureRandom.uuid }
    email { Faker::Internet.email }
    name { Faker::Name.name }
  end
end

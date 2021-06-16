FactoryBot.define do
  factory :project do
    user
    title { '一月の火災で多くを失った、葉山一色海岸「UMIGOYA海小屋」の新たな出発を応援' }
    target_amount { 7_000_000 }
    due_date { '2022-01-01' }
    progress { :incomplete }
  end
end

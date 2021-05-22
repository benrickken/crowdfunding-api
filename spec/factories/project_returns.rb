FactoryBot.define do
  factory :project_return do
    association :project, strategy: :create
    price { 10_000 }
    capacity { 100 }
    delivery_date { '2021-06-30' }
    description { '■『キャンプコット』Naturaldrop× 1個 （ブラック・ベージュ・レッド・グリーン・ブルー） ※ご希望のカラーをお選びください。 ※SNSシェアプレゼントをご希望のかたは、備考欄にSNSアカウント、投稿のURLをご記入ください。 ※製造状況により出荷時期が遅れる場合、早急にご連絡致します。' }
  end
end

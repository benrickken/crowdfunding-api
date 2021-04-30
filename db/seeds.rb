unless User.any?
  User.create!(
    {
      uid: SecureRandom.uuid,
      name: 'John',
    },
  )
end

unless Project.any?
  10.times do
    Project.create!(
      {
        user: User.first,
        title: '一月の火災で多くを失った、葉山一色海岸「UMIGOYA海小屋」の新たな出発を応援',
        target_amount: 7000000,
        due_date: '2021-04-28',
        description: '昨年、コロナ禍による海水浴場開設中止で大打撃を受け、さらに、年明け早々の火災で多くの資産を失うというダブルパンチを喰らった＜UMIGOYA海小屋＞。「どうか困難を乗り越えて、これまで以上に素敵な海の家として再スタートしてほしい！」　そんな応援の気持ちに賛同してくださる方を募っています。',
      }
    )
  end
end

unless ProjectReturn.any?
  10.times do |i|
    ProjectReturn.create!(
      {
        project: Project.first,
        price:  10000,
        capacity: 100,
        delivery_date: '2021-06-30',
        description: '■『キャンプコット』Naturaldrop× 1個 （ブラック・ベージュ・レッド・グリーン・ブルー） ※ご希望のカラーをお選びください。 ※SNSシェアプレゼントをご希望のかたは、備考欄にSNSアカウント、投稿のURLをご記入ください。 ※製造状況により出荷時期が遅れる場合、早急にご連絡致します。',
      }
    )
  end
end

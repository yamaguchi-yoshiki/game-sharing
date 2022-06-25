# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'test@test.com',
  password: 'abc123',
)

Customer.create!(
  [
    {
      id: 1,
      name: 'testing user',
      introduction: 'Hello World!',
      email: 'test@example.com',
      password: 'abc123'
    },{
      id: 2,
      name: 'オリビア',
      introduction: 'よろしくお願いします。',
      email: 'olivia@example.com',
      password: 'password'
    },{
      id: 3,
      name: 'ジェームズ',
      introduction: 'ゲーム大好き！',
      email: 'james@example.com',
      password: 'password'
    },{
      id: 4,
      name: 'ルーカス',
      introduction: 'pro gamer',
      email: 'lucas@example.com',
      password: 'password'
    }
  ]
)

Platform.create!(
  [
    {
      id: 1,
      name: 'P54'
    },{
      id: 2,
      name: 'case'
    }
  ]
)

Game.create!(
  [
    {
      id: 1,
      platform_id: 2,
      game_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename: "sample-post1.jpg"),
      title: 'スーパー配管工ブラザーズ',
      introduction: '2D横スクロールアクション',
      release_date: '2022年6月20日',
      no_tax_price: 5000,
      related_url: 'https://haikankou.example.com'
    },{
      id: 2,
      platform_id: 1,
      game_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename: "sample-post1.jpg"),
      title: 'スーパー爆弾魔',
      introduction: '爆弾を設置して敵を倒そう！',
      release_date: '2022年6月21日',
      no_tax_price: 5000,
      related_url: 'https://bakudan.example.com'
    }
  ]
)

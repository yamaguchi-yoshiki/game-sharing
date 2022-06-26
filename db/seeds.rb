# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'test@example.com',
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
    },{
      id: 3,
      name: 'Zbox third'
    },{
      id: 4,
      name: 'PC'
    }
  ]
)

Game.create!(
  [
    {
      id: 1,
      platform_id: 2,
      game_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game-haikankou.jpg"), filename: "sample-game-haikankou.jpg"),
      title: 'スーパー配管工ブラザーズ',
      introduction: '2D横スクロールアクション',
      release_date: '2022年6月20日',
      no_tax_price: 5000,
      related_url: 'https://haikankou.example.com'
    },{
      id: 2,
      platform_id: 1,
      game_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game-bakudanma.jpg"), filename: "sample-game-bakudanma.jpg"),
      title: 'スーパー爆弾魔',
      introduction: '爆弾を設置して敵を倒そう！',
      release_date: '2022年6月21日',
      no_tax_price: 5000,
      related_url: 'https://bakudan.example.com'
    },{
      id: 3,
      platform_id: 3,
      game_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game-boxcraft.jpg"), filename: "sample-game-boxcraft.jpg"),
      title: 'ボックスクラフト',
      introduction: 'ボックスの世界でサバイバル',
      release_date: '2022年6月25日',
      no_tax_price: 4000,
      related_url: 'https://box-craft.example.com'
    }
  ]
)

Tag.create!(
  [
    {
      id: 1,
      name: 'アクション'
    },{
      id: 2,
      name: '配管工'
    },{
      id: 3,
      name: '爆弾魔'
    },{
      id: 4,
      name: 'アドベンチャー'
    }
  ]
)

GameTag.create!(
  [
    {
      game_id: 1,
      tag_id: 1
    },{
      game_id: 1,
      tag_id: 2
    },{
      game_id: 2,
      tag_id: 1
    },{
      game_id: 2,
      tag_id: 3
    },{
      game_id: 3,
      tag_id: 4
    }
  ]
)

Review.create!(
  [
    {
      customer_id: 1,
      game_id: 1,
      rate: 5,
      comment: 'レビューコメントが入ります。',
      is_public: true
    },{
      customer_id: 2,
      game_id: 1,
      rate: 8,
      comment: '',
      is_public: true
    },{
      customer_id: 2,
      game_id: 3,
      rate: 10,
      comment: '',
      is_public: true
    },{
      customer_id: 3,
      game_id: 1,
      rate: 7,
      comment: '面白い。',
      is_public: true
    },{
      customer_id: 3,
      game_id: 2,
      rate: 6,
      comment: '楽しい',
      is_public: true
    },{
      customer_id: 3,
      game_id: 3,
      rate: 10,
      comment: 'すごい',
      is_public: true
    },{
      customer_id: 4,
      game_id: 2,
      rate: 3,
      comment: 'サーバー強化してください',
      is_public: true
    },{
      customer_id: 4,
      game_id: 3,
      rate: 8,
      comment: '意外と奥が深い',
      is_public: true
    }
  ]
)

ThreadBoard.create!(
  [
    {
      id: 1,
      game_id: 1,
      title: '雑談(自動生成)',
      introduction: 'ゲームを追加すると自動で作られるスレッドです。
      雑談など自由にお使いください。(過度なネタバレはしないようにお願いします。)',
      no_spoiler: true
    },{
      id: 2,
      game_id: 2,
      title: '雑談(自動生成)',
      introduction: 'ゲームを追加すると自動で作られるスレッドです。
      雑談など自由にお使いください。(過度なネタバレはしないようにお願いします。)',
      no_spoiler: true
    },{
      id: 3,
      game_id: 3,
      title: '雑談(自動生成)',
      introduction: 'ゲームを追加すると自動で作られるスレッドです。
      雑談など自由にお使いください。(過度なネタバレはしないようにお願いします。)',
      no_spoiler: true
    },{
      id: 4,
      game_id: 1,
      title: '攻略',
      introduction: '攻略方法教えます',
      no_spoiler: false
    }
  ]
)

ThreadMessage.create!(
  [
    {
      customer_id: 1,
      thread_board_id: 1,
      message: 'スレッドメッセージが入ります。'
    },{
      customer_id: 2,
      thread_board_id: 1,
      message: 'クリアしました。'
    },{
      customer_id: 2,
      thread_board_id: 4,
      message: 'ここをこうして、こうして、こうします。'
    }
  ]
)

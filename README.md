# Game Review&Sharing Ver.1.2

## サイト概要

### サイトテーマ
ゲームのレビューの他に、ゲームについて情報共有を行える機能が備わったゲームのレビューサイトです。

### テーマを選んだ理由
ゲームのレビューサイトは多くありますが、 そのゲームについて気軽に語り合う場所はあまりありません。
自分がゲームをプレイした感想を共有したり、他の人はこのゲームに対してどう思っているのか確認することができ、
更にゲームの情報共有が一つのサイトでできると便利だと思いこのテーマにしました。<br>

新型コロナの影響でオンライン化が進み、家に留まる人が多くなりました。
その影響により、暇な時間に家でゲームをする人が増えてきています。
そういったあまりゲームに触れてこなかった人にもゲームを買う判断材料となり、
需要があると考えています。

### ターゲットユーザー
- ゲームをたくさんプレイしている人
- ゲームについて感想を共有したい人
- ゲームを買うか迷っている人
- 新しいゲームに挑戦したい人

### 主な利用シーン
- ゲームをプレイした時
- ゲームをクリアした時
- ゲームを買うか迷っている時

## 設計書(link)
(一部の機能は未実装です。)
- [実装機能リスト](https://docs.google.com/spreadsheets/d/10w0C5OcfYNOgSt37F0mMMv5TYYKT7cPAA_orx-sMg_k/edit?usp=sharing)
- [ER図](https://drive.google.com/file/d/12x8Rf4UQU5r0xRJBC5R7t_chDb0oYzJ4/view?usp=sharing)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1o1xHG_DKDuOhoySmL7GLulu3A80Kcc272avOaOGKO_0/edit?usp=sharing)
- [詳細設計](https://docs.google.com/spreadsheets/d/17B5TzqxzG5lich7Mdvi_gjnCB-RrW5wjnZLyyauClyk/edit?usp=sharing)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
サイトのロゴにはWixロゴメーカー、アイコンはFontAwesome、星評価はraty-jsを使用しています。<br>
ゲームについて：著作権の関係上、このポートフォリオでは架空のゲーム機種、架空のゲーム名を使ってテストしています。
実際のゲーム画面のキャプチャやキャラクターのイラストは一切使用しておりません。<br>
一部の画像には"いらすとや"を使用しています。

## バージョン履歴
### Ver.1.1
- [Add] placeholderを追加
- [Fix] ゲームに画像が追加できない問題を修正
- [Fix] ログインページのゲストログインのリンクが機能しない問題を修正

### Ver.1.2
- [Update] ゲーム登録、編集フォームの必須項目をわかりやすいように修正
- [Fix] ゲーム価格が空欄で登録できない問題を修正
- [Fix] 他人のユーザー情報、レビューを編集できる問題を修正
- [Fix] 新規登録ページのユーザーネームフォームがeメール設定になっていた問題を修正
- [Fix] その他文法の修正

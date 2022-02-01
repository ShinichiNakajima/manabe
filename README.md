# README

# TODO
- 各種エラーメッセージをrender
- (everenote連携（メールアドレス登録ページを用意する）)
- 視聴ページで新規投稿コメントのタイムスタンプを実装
- コメント検索
- ブックマーク検索
- ブックマーク一覧をn件ごとに表示
- コメントのデータ構造を変更、sentence部をクリックするとhh:mm:ssもテキストに入るように
- ＆テーブルへの保存はsentenceをsplit
- 


## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| evernote_email     | string |                           |

### アソシエーション
has_many :bookmarks
has_many :comments



## bookmarksテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| url    | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

### アソシエーション
belongs_to :user
has_many :comments


## commentsテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| bookmark | references | null: false, foreign_key: true |

### アソシエーション
belongs_to :item
belongs_to :bookmark
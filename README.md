# README

# TODO
- 各種エラーメッセージをrender
- everenote連携（メールアドレス登録ページを用意する）
- 視聴ページで新規投稿コメントのタイムスタンプを実装
- トップページにYoutubeのトップページを表示、URL入力フォームは上に
- ↑ iframeから呼び出すとブロックされる模様
- サインアップ、サインイン画面のデザイン

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
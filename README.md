# Hello C API

（説明が入る予定）

## 事前準備

Hello C API の開発に必要なパッケージをインストールする

```
sudo apt update && sudo apt upgrade -y
```

```
git clone https://github.com/HIT-matsumotolab/HelloC_API.git
```

※ このときに認証情報が確認される  
※ `git` がない場合は `sudo apt install git` でインストールを行う

### Node.js v16のインストール 

```
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
```

```
sudo apt install nodejs -y
```

※ 余力があれば `nodebrew` などのツールを使っても良い

### PostgreSQL v13のインストール
```
sudo apt-get install curl ca-certificates gnupg -y
```

```
curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
```
```
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
```
```
sudo apt update
```
```
sudo apt install postgresql-13 -y
```
```
sudo /etc/init.d/postgresql restart
```

#### PostgreSQLの設定

postgresユーザーのパスワード変更
```
sudo passwd postgres
```
ユーザの変更（postgresに変更）
```
su postgres
```
postgreSQLにログイン
```
psql 
```
postgresロールのパスワード変更（本番環境ではユーザを作成してください）
```
ALTER USER postgres WITH PASSWORD 'password';
```
psqlを抜ける
```
exit
```
初期データを入れる
```
psql -f helloc.sql -Upostgres
```
helloc元データを入れる
※users→groups→books→questions→blank_select_questions→coding_questionsの順番で
```
cd 元データ
psql -U postgres -d helloc -f users.sql
```

元のユーザー戻る
```
exit
```

## env ファイル作成

clone したレポジトリのカレントディレクトリに移動する。現状いるディレクトリ（≒カレントディレクトリ）から参照できる場合を前提とする。

```
cd HelloC_API
```


プロジェクトファイル直下に「.env」ファイルを作成してください  
もしくは `.env.sample` ファイルを複製し、 `.env` にした上で情報を書き換えてください
```
POSTGRES_DB=helloc
POSTGRES_USER=postgres
POSTGRES_PASS=password
POSTGRES_HOST=localhost
POSTGRES_PORT=5432

POST=4000
```

# 実行
```
npm install
```

```
npm run dev
```

http://localhost:4000/status
にアクセス（ほかのアプリと干渉しないように）

ユーザーデータがないので表示されないけど

http://localhost:4000/api/users/
もいける

認証はJWT形式で行っています

※ モデル書き換えられるのでやらないで　メモ程度
```
npx sequelize-auto -o "./src/models" -d helloc -h localhost -u postgres -p 5432 -x password -e postgresql -l esm -C
```

データベース確認方法
```
su postgres
psql
\c helloc
```
テーブル確認
\dt;

コマンドは基本mysqlと同じです

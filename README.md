# 事前準備
```
sudo apt update && sudo apt upgrade -y
```

```
git clone https://github.com/HIT-matsumotolab/HelloC_API.git
```

# Nodejs v16のインストール
```
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
```
```
sudo apt install nodejs -y
```

# PostgreSQL v13のインストール
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

# postgresqlの設定

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
psql -f HelloC_API/initial-helloc-db.sql -Upostgres
```
元のユーザー戻る
```
exit
```

# env ファイル作成
```
cd HelloC_API
```


プロジェクトファイル直下に「.env」ファイルを作成してください
```
POSTGRES_DB=helloc
POSTGRES_USER=postgres
POSTGRES_PASS=password
POSTGRES_HOST=localhost
POSTGRES_PORT=5432

POST=4000
```

※すでに作ってあるのでしなくでいい　メモ程度
```
npx sequelize-auto -o "./src/models" -d helloc -h localhost -u postgres -p 5432 -x データベースパスワード -e postgresql -l esm -C
```

# 実行
```
npm install
```

```
npm run dev
```

http://localhost:4000/
にアクセス（ほかのアプリと干渉しないように）

ユーザーデータがないので表示されないけど

http://localhost:4000/users/
もいける

認証系はないよ

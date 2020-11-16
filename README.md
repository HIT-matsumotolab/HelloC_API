# helloC_API
Dockerコンテナ上で動作するhelloCに関するAPIです

docker環境（docker, docker-compose）を用意してください

導入の仕方は下記のリンクに乗ってます！！（わからなければ大野へ）

[docker公式サイト](https://docs.docker.jp/get-docker.html)

## 動作方法

まず，本コードをローカル環境にクローンしてください（ダウンロードみたいなもの）

そしてsqlファイルは松本研究室のNASにはいってるのでダウンロードして下記のリンクに入れてください
```
自分のクローン先リンク/helloC_API/mysql/docker-entrypoint-initdb.d
```

クローン先のディレクトリに入って

dockerを起動してください（初回は時間がかかります）
```
docker-compose up -d
```

起動確認（なくても動作には関係ないですが初めての人は見ておきましょう　問題があればここにexitなどが表示されます）
```
docker-compose ps
```

ここからはdockerファイルに記述して自動化することが可能ですが、開発環境なため自分で行ってください

nodeの中に入りましょう
```
docker-compose node exec bash
```

dockerコンテナに入ったら
```
cd src/api/
```
API起動（開発用）
```
node app.js
```

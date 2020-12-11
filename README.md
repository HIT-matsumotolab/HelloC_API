# helloC_API
Dockerコンテナ上で動作するhelloCに関するAPIです

docker環境（docker, docker-compose）を用意してください
（できればgitとGitHubも使ってくれるとありがたい）

導入の仕方は下記のリンクに乗ってます！！（わからなければ大野へ）

[docker公式サイト](https://docs.docker.jp/get-docker.html)

まず，本コードをローカル環境にクローンしてください（ダウンロードみたいなもの）

そしてsqlファイルは松本研究室のNASにはいってるのでダウンロードして下記のリンクに入れてください
```
自分のクローン先リンク/helloC_API/mysql/docker-entrypoint-initdb.d
```

helloC_APIファルダ直下の.envファイルの中身を変更してください

## 動作方法(コマンドを使用)
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
cd src
```
API起動（開発用）
```
node api/app.js
```

## 動作方法(VScodeを使用)

以下のサイトからダウンロードしてください
[vscode公式サイト](https://azure.microsoft.com/ja-jp/products/visual-studio-code/)

必要な拡張機能(vscode)

拡張機能ボタンを押し下記のワードで検索

- Docker　(ms-azuretools.vscode-docker

- Remote - Containers　(ms-vscode-remote.remote-containers

左下の緑のボタンが追加されたらOK（されない場合はVScodeを再起動）

緑のボタンを押し,Remote-Containenr:Open Folder in Containerを押す

コンテナ起動　起動完了

vscode内のターミナル表示して以下のコマンドを打つ

ディレクトリ移動
```
cd node/src
```
API起動（開発時）
```
node api/app.js
```

# EC-Cube 2.17
ローカルで開発環境用

# Requirement
先に[Docker](https://www.docker.com/)インストールして下さい。 \
以下のホストのポートを空けてください。
```
8080 : EC-Cube
9080 : phpMyAdmin
13306 : mysql
1080 & 1025 : mailcatcher
```

# コマンドリスト
WindowsならCMDからアクセスして、ProjectのROOTフォルダに移動して、
以下のコマンドを使って下さい。[command list](https://docs.docker.com/compose/reference/)
```
docker-compose up -d    # 全てのコンテナーを起動する
docker-compose down     # 全てのコンテナーを停止する

docker-compose exec web bash   # ECCubeのコンテナーに入る
```

# 備考
コンテナーを作成する時にComposerまだインストールされてない状態なので、自分でコンテナーに入って、実行して下さい。
```
docker-compose exec web bash
composer install
```

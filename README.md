# README
（作成中）

BacklogのイベントをSlackに通知するアプリケーションです。
RAILSのAPIモードで実装しています。

## Version

ruby 3.0.0

rails 6.1.3

## 環境構築

`.env`ファイルを作成する

```
touch .env
```

.envファイルに環境変数を設定する

```
SLACK_OAUTH_TOKEN = # SlackのOAUTH_TOKEN
SLACK_CHANNEL = # 通知先のSlackのチャンネル
BACKLOG_API_KEY = # BacklogのAPIキー
BACKLOG_SPACE_ID = # BacklogのスペースID
BACKLOG_PROJECT_NAME = # Backlogのプロジェクト名
BACKLOG_PROJECT_ID = # BacklogのプロジェクトID
BACKLOG_ISSUE_TYPE_ID = # Backlogの課題種別
```

railsを起動 

```
rails s
```

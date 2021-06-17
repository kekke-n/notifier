# 環境変数読み込み
source .config

# jsonデータ読み込み
PARAMS=`cat update_issue.json`

curl -X POST localhost:3008/backlog/post_to_google_chat?token=$API_TOKEN \
-H 'Content-Type: application/json;' \
-d "$PARAMS"

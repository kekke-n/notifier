# 環境変数読み込み
SCRIPT_PATH=$(dirname $0)
ROOT_PATH=$(dirname $SCRIPT_PATH)

source $ROOT_PATH/.env

# jsonデータ読み込み
PARAMS=`cat $SCRIPT_PATH/update_issue.json`

curl -X POST localhost:3008/backlog/bug_report?token=$API_TOKEN \
-H 'Content-Type: application/json;' \
-d "$PARAMS"

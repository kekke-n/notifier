curl -X POST localhost:3008/backlog/post_to_google_chat \
-H 'Content-Type: application/json;' \
-d '{"content": {
      "id": 1,
      "key_id":"9551",
      "summary":"テスト課題",
      "comment": {"content" : "対応完了しました。"},
      "status":   {"id":4, "name":"完了"},
      "priority": {"id":3, "name":"中"},
      "changes": [
        {
          "field":"status",
          "new_value":"4",
          "old_value":"2",
          "type":"standard"
        }
      ]
} }'
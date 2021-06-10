class BacklogController < ApplicationController

  def post_to_slack
    body = Backlog::Issue::Bug.body
    Slack.post(body)
  end

  def post_to_google_chat
    content  = params.require(:content).permit!
    changes = content[:changes].first # 配列の最初の要素にある

    if changes[:field] == "status" && changes[:new_value] == "4"
      # 完了ステータスに更新された時だけチャットに通知
      updated_info = GoogleChat.body(content)
      GoogleChat.post(updated_info)

      # Slackに不具合の件数を通知
      bug_info = Backlog::Issue::Bug.body
      Slack.post(updated_info << bug_info)
    end
  end

  private

end

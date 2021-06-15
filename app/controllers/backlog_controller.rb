class BacklogController < ApplicationController

  def post_to_slack
    body = Backlog::Issue::Bug.report
    Slack.post(body)
  end

  def post_to_google_chat
    content  = params.require(:content).permit!
    changes = content[:changes]&.first || {} # 配列の最初の要素にある

    if changes[:field] == "status" && changes[:new_value] == "4"
      # 完了ステータスに更新された時だけチャットに通知
      updated_info = GoogleChat.body(content)
      GoogleChat.post(updated_info)

      # Slackに不具合の件数を通知
      bug_info = Backlog::Issue::Bug.report
      Slack.post(updated_info << bug_info)
    end

    # TODO:課題登録時にGoogolChatに通知する
    if false
      created_message = GoogleChat.created_message
      GoogleChat.post(created_message)
    end
  end

  private

end

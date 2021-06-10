class BacklogController < ApplicationController

  def post_to_slack
    body = Backlog::Issue::Bug.body
    Slack.post(body)
  end

  def post_to_google_chat
    content  = params.require(:content).permit!

    if content[:status][:id] == '4' # 完了ステータス
      body = GoogleChat.body(content)
      GoogleChat.post(body)
    end
  end

  private

end

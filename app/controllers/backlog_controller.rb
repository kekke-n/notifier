class BacklogController < ApplicationController

  def post_to_slack
    body = Backlog::Issue::Bug.body
    Slack.post(body)
  end

  def post_to_google_chat
    # TODO:更新されたIssueの状態を通知する
    text = 'issueが更新されました。'
    GoogleChat.post(text)
  end

  private

end

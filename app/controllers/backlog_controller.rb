class BacklogController < ApplicationController

  def post_to_slack
    @issues = Backlog.bug_issues
    issue_count = @issues.length
    issue_list_url = Backlog.bug_issue_list_url
    body = <<~"TEXT"
      不具合残り *#{issue_count}件！* 
      高:#{priority[:high].length}/中:#{priority[:mid].length}/低:#{priority[:low].length}
      <#{issue_list_url}|不具合一覧>
    TEXT

    Slack.post(body)
  end

  def post_to_google_chat
    # TODO:更新されたIssueの状態を通知する
    text = 'issueが更新されました。'
    GoogleChat.post(text)
  end

  private
  def priority
    priority = {}
    priority[:high] = []
    priority[:mid] = []
    priority[:low] = []
    @issues.each do |issue|
      case issue["priority"]["name"]
      when "高"
        priority[:high] << issue
      when "中"
        priority[:mid] << issue
      when "低"
        priority[:low] << issue
      else
        priority[:low] << issue
      end
    end
    priority
  end
end

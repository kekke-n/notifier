class Backlog::Issue::Bug < Backlog::Issue::Base
  def self.list_url
    "https://#{BACKLOG_SPACE_ID}.backlog.jp/find/#{BACKLOG_PRJ_NAME}?issueTypeId=#{BACKLOG_ISSUE_TYPE_ID}&statusId=1&statusId=2&statusId=3&sort=PRIORITY&order=true"
  end

  def self.fetch
    fetch_issues(
      backlog_issue_type_id: BACKLOG_ISSUE_TYPE_ID
    )
  end
end

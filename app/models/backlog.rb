class Backlog
  require 'net/http'

  include ActiveModel::Model

  BACKLOG_API_KEY = ENV['BACKLOG_API_KEY']
  BACKLOG_SPACE_ID = ENV['BACKLOG_SPACE_ID']
  BACKLOG_PRJ_ID = ENV['BACKLOG_PROJECT_ID']
  BACKLOG_PRJ_NAME = ENV['BACKLOG_PROJECT_NAME']
  BACKLOG_ISSUE_TYPE_ID = ENV['BACKLOG_ISSUE_TYPE_ID']

  def self.fetch_issues(opt = {})
    get_params = "count=100&issueTypeId[]=#{opt[:backlog_issue_type_id]}&projectId[]=#{BACKLOG_PRJ_ID}&statusId[]=1&statusId[]=2&statusId[]=3&apiKey=#{BACKLOG_API_KEY}"
    uri = URI.parse("https://#{BACKLOG_SPACE_ID}.backlog.jp/api/v2/issues?#{get_params}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def self.bug_issue_list_url
    "https://#{BACKLOG_SPACE_ID}.backlog.jp/find/#{BACKLOG_PRJ_NAME}?issueTypeId=#{BACKLOG_ISSUE_TYPE_ID}&statusId=1&statusId=2&statusId=3&sort=PRIORITY&order=true"
  end

  def self.bug_issues
    fetch_issues(
      backlog_issue_type_id: BACKLOG_ISSUE_TYPE_ID
    )
  end
end
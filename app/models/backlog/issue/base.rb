class Backlog::Issue::Base < Backlog::Base
  def self.fetch_issues(opt = {})
    get_params = "count=100&issueTypeId[]=#{opt[:backlog_issue_type_id]}&projectId[]=#{BACKLOG_PRJ_ID}&statusId[]=1&statusId[]=2&statusId[]=3&apiKey=#{BACKLOG_API_KEY}"
    uri = URI.parse("https://#{BACKLOG_SPACE_ID}.backlog.jp/api/v2/issues?#{get_params}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end

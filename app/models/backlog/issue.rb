class Backlog::Issue < Backlog
  def self.fetch(opt = {})
    get_params = "count=100&issueTypeId[]=#{opt[:backlog_issue_type_id]}&projectId[]=#{BACKLOG_PRJ_ID}&statusId[]=1&statusId[]=2&statusId[]=3&apiKey=#{BACKLOG_API_KEY}"
    uri = URI.parse("https://#{BACKLOG_SPACE_ID}.backlog.jp/api/v2/issues?#{get_params}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def self.list_url(opt = {})
    "https://#{BACKLOG_SPACE_ID}.backlog.jp/find/#{BACKLOG_PRJ_NAME}?issueTypeId=#{opt[:backlog_issue_type_id]}&statusId=1&statusId=2&statusId=3&sort=PRIORITY&order=true"
  end

  def self.body(opt = {})
  end

  def self.priority
    priority = {}

    issues = fetch
    priority[:length] = issues.length
    priority[:high] = []
    priority[:mid] = []
    priority[:low] = []

    issues.each do |issue|
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

class Backlog::Issue::Bug < Backlog::Issue::Base
  def self.fetch
    super(backlog_issue_type_id: BACKLOG_ISSUE_TYPE_ID)
  end

  def self.list_url
    super(backlog_issue_type_id: BACKLOG_ISSUE_TYPE_ID)
  end
end

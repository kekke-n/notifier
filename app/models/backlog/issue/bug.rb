class Backlog::Issue::Bug < Backlog::Issue
  def self.fetch
    super(backlog_issue_type_id: BACKLOG_ISSUE_TYPE_ID)
  end

  def self.list_url
    super(backlog_issue_type_id: BACKLOG_ISSUE_TYPE_ID)
  end

  def self.body
    <<~"TEXT"
      不具合残り *#{priority[:length]}件！* 
      高:#{priority[:high].length}/中:#{priority[:mid].length}/低:#{priority[:low].length}
      <#{list_url}|不具合一覧>
    TEXT
  end

  def self.priority
    super
  end
end

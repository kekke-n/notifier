module UriUtil
  GOOGLE_CHAT_SPACE = ENV['GOOGLE_CHAT_SPACE']
  GOOGLE_CHAT_KEY = ENV['GOOGLE_CHAT_KEY']
  GOOGLE_CHAT_TOKEN = ENV['GOOGLE_CHAT_TOKEN']
  BACKLOG_PROJECT_NAME = ENV['BACKLOG_PROJECT_NAME']
  BACKLOG_SPACE_ID = ENV['BACKLOG_SPACE_ID']

  private_constant :GOOGLE_CHAT_SPACE
  private_constant :GOOGLE_CHAT_KEY
  private_constant :GOOGLE_CHAT_TOKEN
  private_constant :BACKLOG_PROJECT_NAME
  private_constant :BACKLOG_SPACE_ID

  # Backlog
  def self.backlog_domain
    "#{BACKLOG_SPACE_ID}.backlog.jp"
  end

  def self.backlog_url
    "https://#{backlog_domain}"
  end

  def self.backlog_key_name(key_id)
    "#{BACKLOG_PROJECT_NAME}-#{key_id}"
  end

  def self.backlog_view_url(key_id)
    "#{backlog_url}/view/#{backlog_key_name(key_id)}"
  end

  # Google Chat
  def self.google_chat_domain
    "chat.googleapis.com"
  end

  def self.google_chat_url
    "https://#{google_chat_domain}"
  end

  def self.google_chat_msg_post_url
    "#{google_chat_url}/v1/spaces/#{GOOGLE_CHAT_SPACE}/messages?key=#{GOOGLE_CHAT_KEY}&token=#{GOOGLE_CHAT_TOKEN}"
  end
end
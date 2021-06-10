class GoogleChat < ApplicationRecord
  require 'net/http'

  include ActiveModel::Model

  GOOGLE_CHAT_SPACE = ENV['GOOGLE_CHAT_SPACE']
  GOOGLE_CHAT_KEY = ENV['GOOGLE_CHAT_KEY']
  GOOGLE_CHAT_TOKEN = ENV['GOOGLE_CHAT_TOKEN']
  BACKLOG_PROJECT_NAME = ENV['BACKLOG_PROJECT_NAME']
  BACKLOG_SPACE_ID = ENV['BACKLOG_SPACE_ID']

  class << self
    def post(body)
      uri = URI.parse("https://chat.googleapis.com/v1/spaces/#{GOOGLE_CHAT_SPACE}/messages?key=#{GOOGLE_CHAT_KEY}&token=#{GOOGLE_CHAT_TOKEN}")
      headers = { "Content-Type" => "application/json; charset=UTF-8" }
      post_params = { text: body }
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme === "https"
      http.post uri, post_params.to_json, headers
    end

    # @param [Hash] updated issue contents.
    # @opt [Hash] status
    # @opt [Hash] priority
    def body(contents = {})
      summary = contents[:summary]
      status_name = contents[:status][:name]
      comment = contents[:comment]
      key_id = contents[:key_id]
      issue_url = "https://#{BACKLOG_SPACE_ID}.backlog.jp/view/#{BACKLOG_PROJECT_NAME}-#{key_id}"
      body =<<~"TEXT"
        課題「#{summary}」のステータスが「#{status_name}」に更新されました。
        #{issue_url}
      TEXT
      if comment.present?
        body << <<~"TEXT"
        ---------------------------------------
        #{comment}
        ---------------------------------------
        TEXT
      end

      body_log(body)
      body
    end

    private
    def body_log(body)
      puts "-----body-----"
      puts "#{body}"
      puts "-----body-----"
    end
  end
end

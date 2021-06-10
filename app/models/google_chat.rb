class GoogleChat < ApplicationRecord
  require 'net/http'

  include ActiveModel::Model
  include UriUtil

  class << self
    def post(body)
      uri = URI.parse(UriUtil.google_chat_msg_post_url)
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
      summary     = contents[:summary]
      status_name = contents[:status][:name]
      comment     = contents[:comment][:content]
      key_id      = contents[:key_id]
      key_name   = UriUtil.backlog_key_name(key_id)
      issue_url   = UriUtil.backlog_view_url(key_id)
      body =<<~"TEXT"
        #{key_name} #{summary}
        #{issue_url}
        ステータスが「#{status_name}」に更新されました。
      TEXT
      if comment.present?
        body << <<~"TEXT"
        ```
        #{comment}
        ```
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

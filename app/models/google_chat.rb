class GoogleChat < ApplicationRecord
  require 'net/http'

  include ActiveModel::Model

  GOOGLE_CHAT_SPACE = ENV['GOOGLE_CHAT_SPACE']
  GOOGLE_CHAT_KEY = ENV['GOOGLE_CHAT_KEY']
  GOOGLE_CHAT_TOKEN = ENV['GOOGLE_CHAT_TOKEN']

  def self.post(body)
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
  def self.body(contents = {})
    summary = contents[:summary]
    status_name = contents[:status][:name]
    comment = contents[:comment]
    body =<<~"TEXT"
      課題「#{summary}」のステータスが「#{status_name}」に更新されました。
      #{comment}
    TEXT
    puts "-----body-----"
    puts "#{body}"
    puts "-----body-----"
  end
end

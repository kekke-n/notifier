class Slack
  require 'net/http'

  include ActiveModel::Model

  SLACK_OAUTH_TOKEN = ENV['SLACK_OAUTH_TOKEN']
  SLACK_CHANNEL = ENV['SLACK_CHANNEL']

  def self.post(body)
    post_params = {
      token: SLACK_OAUTH_TOKEN,
      channel: "#" + SLACK_CHANNEL,
      text: body,
    }
    uri = URI.parse('https://slack.com/api/chat.postMessage')
    Net::HTTP.post_form uri, post_params
  end
end

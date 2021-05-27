require 'net/http'
require 'uri'

class BacklogController < ApplicationController
  def notify_to_slack
    post_params = {
      token: ENV['SLACK_OAUTH_TOKEN'],
      channel: '#bot_test',
      text: '*テキスト*',
    }
    uri = URI.parse('https://slack.com/api/chat.postMessage')
    response = Net::HTTP.post_form uri, post_params
  end
end

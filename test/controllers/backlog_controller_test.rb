require "test_helper"

class BacklogControllerTest < ActionDispatch::IntegrationTest
  test "should get notify_to_slack" do
    get backlog_notify_to_slack_url
    assert_response :success
  end
end

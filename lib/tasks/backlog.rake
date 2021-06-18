namespace :backlog do
  desc "notify_bug_report"
  task :notify_bug_report do
    puts "[#{Time.now.to_s(:hm)}] kick cron!"
    # TODO
    # updated_info = GoogleChat.body(content)
    # bug_info = Backlog::Issue::Bug.report
    # Slack.post(updated_info << bug_info)
  end
end

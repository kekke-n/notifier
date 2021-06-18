namespace :backlog do
  desc "notify_bug_report"
  task notify_bug_report: :environment do
    bug_info = Backlog::Issue::Bug.report
    puts bug_info
    Slack.post(bug_info)
  end
end

namespace :backlog do
  desc "notify_bug_report"
  task notify_bug_report: :environment do
    puts "-----------------------------"
    puts "Time : #{Time.now}"
    bug_info = Backlog::Issue::Bug.report
    puts bug_info
    Slack.post(bug_info)
    puts "-----------------------------"
  end
end

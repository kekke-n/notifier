# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# crontabの更新
# bundle exec whenever --update-crontab
# crontabの確認
# crontab -l

ENV.each { |k, v| env(k, v) }

set :output, "/app/log/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
#

# Time クラスの拡張を利用するため ActiveSupport を require する
require 'active_support/core_ext/time'

# 時刻の文字列を日本時間で解釈して、システムのタイムゾーンに変換
def jst(time)
  Time.zone = 'Asia/Tokyo'
  Time.zone.parse(time).localtime($system_utc_offset)
end

every 1.day, at: jst('9:00 am') do
  rake 'backlog:notify_bug_report'
end

# Learn more: http://github.com/javan/wheneve
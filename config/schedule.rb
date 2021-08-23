# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

require File.expand_path(File.dirname(__FILE__) + '/environment')
env 'PATH', ENV['PATH']
rails_env = ENV['RAILS_ENV'] || :development
set :output, "#{Rails.root}/log/cron.log"
# ジョブの実行環境の指定
set :environment, rails_env

every 1.minutes do
  rake "thanxmailer_a:thanxmailer_a" 
end

# set :output, "/path/to/my/cron_log.log"
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

# Learn more: http://github.com/javan/whenever

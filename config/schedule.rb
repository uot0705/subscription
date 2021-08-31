require File.expand_path(File.dirname(__FILE__) + '/environment')
require 'active_support/core_ext/time'
set :path_env, ENV['PATH']
job_type :runner, "cd :path && PATH=':path_env' bin/rails runner -e :environment ':task' :output"
job_type :rake, 'export PATH="$HOME/.rbenv/bin:$PATH"; eval "$(rbenv init -)"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output'
rails_env = ENV['RAILS_ENV'] || :development
set :output, environment == 'development' ? 'log/crontab.log' : '/deploy/apps/subscription/shared/log/crontab.log'
set :environment, rails_env

def local(time)
  Time.zone = 'Asia/Tokyo'
  Time.zone.parse(time).localtime($system_utc_offset)
end

# 毎月1日の9:30に起動(月１)
every local('48 14 31 * *') do
  rake "thanxmailer_a:thanxmailer_a" 
end

# 毎月1日の9:30に起動(月２)
every '30 9 1 * *' do
  rake "thanxmailer_b:thanxmailer_b" 
end

# 毎月15日の9:30に起動(月２)
every '30 9 15 * *' do
  rake "thanxmailer_c:thanxmailer_c" 
end
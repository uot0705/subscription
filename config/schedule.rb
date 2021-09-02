require File.expand_path(File.dirname(__FILE__) + '/environment')
set :path_env, ENV['PATH']
job_type :runner, "cd :path && PATH=':path_env' bin/rails runner -e :environment ':task' :output"
job_type :rake,   "cd :path && PATH=':path_env' :environment_variable=:environment bundle exec rake :task --silent :output"
rails_env = ENV['RAILS_ENV'] || :production
set :output, "#{Rails.root}/log/cron.log"
set :environment, rails_env

# 毎月1日の9:30に起動(月１)下記時間から-
every  '30 9 5 * *' do
  rake "thanxmailer_a:thanxmailer_a" 
end

# 毎月1日の9:30に起動(月２)
every '30 9 5 * *' do
  rake "thanxmailer_b:thanxmailer_b" 
end

# 毎月15日の9:30に起動(月２)
every '30 9 8 * *' do
  rake "thanxmailer_b:thanxmailer_b" 
end
namespace :thanxmailer_a do
  desc '定期テスト'
  task thanxmailer_a: :environment do
    ThanxMailer.a.deliver_now
  end
 end
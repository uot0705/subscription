namespace :thanxmailer_a do
  desc '定期テスト'
  task thanxmailer_a: :environment do
    @user = User.where(check: '月1')
    @user.each do |user|
      ThanxMailer.a(user).deliver_now
    end
  end
end

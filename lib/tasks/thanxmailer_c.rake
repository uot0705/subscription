namespace :thanxmailer_c do
  desc '定期テスト'
  task thanxmailer_c: :environment do
    @user = User.where(check: '月2')
    @user.each do |user|
      ThanxMailer.a(user).deliver_now
    end
  end
end

namespace :thanxmailer_b do
  desc '定期テスト'
  task thanxmailer_b: :environment do
    @user = User.where(check: "月2")
    @user.each do |user|
      ThanxMailer.a(user).deliver_now
    end
  end
 end
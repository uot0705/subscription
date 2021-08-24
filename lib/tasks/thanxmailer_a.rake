namespace :thanxmailer_a do
  desc '定期テスト'
  task thanxmailer_a: :environment do
    @user = User.where(check: "あり")
    @user.each do |user|
      ThanxMailer.a(user).deliver_now
    end
  end
 end
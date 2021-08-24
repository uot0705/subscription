class ThanxMailer < ApplicationMailer
 

  def complete_registration(user)
    @user = user
    mail(
      subject: "アカウント登録完了のご案内。", #メールのタイトル
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end

  def a(user)
    @user = user
    @content = Content.where(user: @user)
    mail to: @user.email, subject: "【お知らせ】サブスク契約内容"
  end

end  
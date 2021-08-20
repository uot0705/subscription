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

end  
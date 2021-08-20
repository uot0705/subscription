# Preview all emails at http://localhost:3000/rails/mailers/thanx_mailer
class ThanxMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/thanx_mailer/complete_registration
  def complete_registration
    ThanxMailer.complete_registration
  end

end

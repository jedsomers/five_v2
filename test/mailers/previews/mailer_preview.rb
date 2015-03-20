# Preview all emails at http://localhost:3000/rails/mailers/mailer
class MailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mailer/invitation
  def invitation
    Mailer.invitation
  end

  # Preview this email at http://localhost:3000/rails/mailers/mailer/request
  def request
    Mailer.request
  end

  # Preview this email at http://localhost:3000/rails/mailers/mailer/password_reset
  def password_reset
    Mailer.password_reset
  end

end

class Mailer < ActionMailer::Base
  default from: "noreply@fiveme.io"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.invitation.subject
  #
  def deliver_invitation(invitation, signup_url)
    @invite = invitation
    mail(to: @invite.recipient_email, subject: 'Invitation for Five', body: signup_url)
    invitation.update_attribute(:sent_at, Time.now)
  end
  
  def want_invite(invitation)
    @invite = invitation
    mail(to: 'jed@fiveme.io; jeff@fiveme.io', subject: @invite.recipient_email)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.request.subject
  #
  def request
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end

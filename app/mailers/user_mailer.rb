class UserMailer < ApplicationMailer
  default from: 'hi@askmindapp.com'

  def recover_password(email, code)
    @code = code
    subject = '[Mind] Password Recovery'
    mail(to: email, subject: subject)
  end
end

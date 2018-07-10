class UserMailer < ApplicationMailer
  default from: 'support@mind.ru'

  def recover_password(email, code)
    @code = code
    subject = '[Mind] Password Recovery'
    mail(to: email, subject: subject)
  end
end

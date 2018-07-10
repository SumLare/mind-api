# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def recover_password
    verification_token = VerificationToken.first
    UserMailer.recover_password(verification_token.email, verification_token.code)
  end
end

class VerificationToken < ApplicationRecord
  ALPHABET = ('0'..'9').to_a
  CODE_LENGTH = 5

  attr_accessor :entered_code

  before_create :generate_code
  after_create_commit :enqueue_verification_token_dispatch

  has_secure_token

  scope :verified, -> { where(verified: true) }

  def verify(code)
    return false unless self.code == code || demo?(code)

    update(verified: true)
  end

  def user
    User.find_by(email: email)
  end

  def as_json(_)
    { email: email, token: token }
  end

  private

  def enqueue_verification_token_dispatch
    UserMailer.recover_password(email, code).deliver_later
  end

  def generate_code
    self.code = Array.new(CODE_LENGTH) { ALPHABET.sample }.join
  end

  def demo?(code)
    return false if code.blank?

    email == Rails.application.credentials.demo.dig(:email) &&
      code == Rails.application.credentials.demo.dig(:code)
  end
end

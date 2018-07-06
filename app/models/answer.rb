class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  has_many :comments, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  has_many :views, dependent: :destroy

  after_create :notify

  has_one_attached :video

  def viewed?(user)
    user.viewed_answers.include?(self)
  end

  private

  def notify
    Notifier.new(user.followers, "Новый ответ от #{user.full_name}").call
  end
end

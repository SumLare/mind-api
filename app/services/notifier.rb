class Notifier
  def initialize(users, message, options = {})
    @users = users
    @message = message
    @options = options
  end

  def call
    @users.each do |user|
      next if user.device_token.blank?

      notification = Houston::Notification.new(
        token: user.device_token,
        alert: @message, badge: 1, custom_data: @options
      )
      client.push(notification)

      Rails.logger.debug "#{Time.zone.now} iOS notification: #{@message}, user: #{user.id}"
      Rails.logger.debug "Error: #{notification.error}." if notification.error
    end
  end

  private

  def client
    if Rails.application.secrets.apn_environment == 'production'
      Houston::Client.production
    else
      Houston::Client.development
    end
  end
end

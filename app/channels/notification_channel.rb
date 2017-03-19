class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_for 'web_notifications'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

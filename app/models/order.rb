class Order < ApplicationRecord
  belongs_to :user
  monetize :amount_fens # or :amount_pennies

  after_commit :run_notification, on: :update

  def run_notification
    if state == 'paid' && payment.present? # state_was == 'paid' also
      NotificationChannel.broadcast_to user, shop_event: 'order_paid', order_id: id
    end
  end
end

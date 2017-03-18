class PaymentsController < ApplicationController
  def show
    @order = Order.where(state: 'pending').find(params[:order_id])

    pay_params = {
      body: @order.teddy_sku,
      out_trade_no: "teddies_shop_#{@order.id}",
      total_fee: @order.amount_fens,
      spbill_create_ip: Socket.ip_address_list.detect(&:ipv4_private?).ip_address,
      notify_url: Figaro.env.wechat_pay_notify_url,
      trade_type: 'NATIVE'
    }
    r = WxPay::Service.invoke_unifiedorder pay_params

    if r.success?
      @qr = RQRCode::QRCode.new(r['code_url'])
    end
  end
end

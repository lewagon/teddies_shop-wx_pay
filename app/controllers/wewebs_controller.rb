class WewebsController < ApplicationController
  wechat_api
  layout 'wechat'
  skip_before_action :authenticate_user!, only: %i[pay index]

  def index
    @teddies = Teddy.all
    @title = 'New teddies shop on Wechat'
    @message_desc = 'Build for Le Wagon Shanghai in Wechat'
  end

  def show
    @teddy = Teddy.find(params[:id])
  end

  def pay
    wechat_oauth2 do |openid|
      @teddy = Teddy.find(params[:teddy_id])
      order  = Order.create!(teddy_sku: @teddy.sku, amount: @teddy.price, state: 'pending', user: current_user)

      pay_params = {
        body: order.teddy_sku,
        out_trade_no: "teddies_shop_order_id_#{order.id}",
        total_fee: order.amount_fens,
        spbill_create_ip: request.ip,
        notify_url: Figaro.env.wechat_pay_notify_url,
        trade_type: 'JSAPI',
        openid: openid
      }

      prepay_result = WxPay::Service.invoke_unifiedorder(pay_params)
      if prepay_result.success?
        js_pay_params = {
          prepayid: prepay_result['prepay_id'],
          noncestr: prepay_result['nonce_str']
        }
        @pay_params = WxPay::Service.generate_js_pay_req js_pay_params
        logger.info @pay_params
      else
        logger.error prepay_result['return_msg']
      end
    end
  end
end

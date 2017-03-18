# required
WxPay.appid = Figaro.env.wechat_app_id
WxPay.key = Figaro.env.wechat_pay_api_key
WxPay.mch_id = Figaro.env.wechat_pay_mch_id
WxPay.debug_mode = true # default is `true`

# optional - configurations for RestClient timeout, etc.
WxPay.extra_rest_client_options = { timeout: 2, open_timeout: 3 }

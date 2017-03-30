class WechatsController < ActionController::Base
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-controller-dsl
  wechat_responder

  on :click, with: 'BTN_COUPON' do |request, key|
    request.reply.text "User #{request[:FromUserName]} EventKey #{key} happen"
  end

  on :click, with: 'BTN_PROMOTION' do |request, key|
    request.reply.text "User #{request[:FromUserName]} EventKey #{key} happen"
  end

  on :text do |request, content|
    request.reply.text "echo: #{content}" # Just echo
  end
end

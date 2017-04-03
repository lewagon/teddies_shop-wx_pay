class WechatsController < ActionController::Base
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-controller-dsl
  wechat_responder

  on :click, with: 'BTN_COUPON' do |request, key|
    request.reply.text "User #{request[:FromUserName]} EventKey #{key} happen"
  end

  on :click, with: 'BTN_PROMOTION' do |request|
    news = [{ title: 'Time limit promotion', description: 'Next batch early bird access',
              pic_url: 'http://mmbiz.qpic.cn/mmbiz_jpg/kDhl1Ny7yoR1OvNKibKNW7INHiaohlmlRibicF3o0W6Q74hucE3U0FMdLzJHbjhuvgWvOYDibZAYzVKK0RXyPnk0nHQ/0',
              url: 'http://teddies-shop.shanghaiwogeng.com/' }]
    request.reply.news(news)
  end

  on :text do |request, content|
    request.reply.text "echo: #{content}" # Just echo
  end
end

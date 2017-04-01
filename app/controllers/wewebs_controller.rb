class WewebsController < ApplicationController
  wechat_api
  layout 'wechat'

  def index
    @teddies = Teddy.all
  end
end

class WewebsController < ApplicationController
  wechat_api
  layout 'wechat'

  def index
    @teddies = Teddy.all
  end

  def show
    @teddy = Teddy.find(params[:id])
  end
end

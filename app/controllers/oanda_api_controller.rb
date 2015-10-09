class OandaApiController < ApplicationController
  before_action { @client = OandaAPI::Client::TokenClient.new(:practice, Rails.application.secrets.oanda_token) }  


  def index
    @candles = Rsi.new(@client, granuality: 'M15').fetch_candles
  end

  def show

  end
end

class OandaApiController < ApplicationController
  before_action { @client = OandaAPI::Client::TokenClient.new(:practice, Rails.application.secrets.oanda_token) }  


  def index
    @candles = GetCandles.new(@client, granuality: 'M15').fetch_candles
    
    @london_time = GetTime.new.london
    @newyork_time = GetTime.new.newyork
    @sydney_time = GetTime.new.sydney
    @tokio_time = GetTime.new.tokio

    @london_market = Market.new(@london_time).open?
    @sydney_market = Market.new(@sydney_time).open?
    @newyork_market = Market.new(@newyork_time).open?
    @tokio_market = Market.new(@tokio_time).open?


  end

  def show
  end


end

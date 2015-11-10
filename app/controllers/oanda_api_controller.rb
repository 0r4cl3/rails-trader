class OandaApiController < ApplicationController
  before_action { @client = OandaAPI::Client::TokenClient.new(:practice, Rails.application.secrets.oanda_token) }  


  def index
    @granularity = params[:granularity] || 'M15'
    @options_for_granularity = [['M1', 'M1'], ['M15', 'M15'], ['M30', 'M30']]
    @count = params[:count] || 100
    @options_for_count = [[10, 10], [20, 20]]
    @candles = GetCandles.new(@client, granularity: @granularity, count: @count).fetch_candles
    
    @london_time = GetTime.new.london
    @newyork_time = GetTime.new.newyork
    @sydney_time = GetTime.new.sydney
    @tokio_time = GetTime.new.tokio

    @london_market = Market.new(@london_time).open?
    @sydney_market = Market.new(@sydney_time).open?
    @newyork_market = Market.new(@newyork_time).open?
    @tokio_market = Market.new(@tokio_time).open?

    @rsi = Rsi.new(@candles).calculate_rsi
  end

  def show
  end
private


end

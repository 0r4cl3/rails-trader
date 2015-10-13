class OandaApiController < ApplicationController
  before_action { @client = OandaAPI::Client::TokenClient.new(:practice, Rails.application.secrets.oanda_token) }  


  def index
    @candles = GetCandles.new(@client, granuality: 'M15').fetch_candles
    @london_time = get_london_time
    @newyork_time = get_newyork_time
    @tokio_time = get_tokio_time
    @sydney_time = get_sydney_time

    @time = Time.now.utc.hour
  end

  def show

  end

  private

  def dst
    @dst ||= Time.now.dst?
  end

  def get_london_time
    dst == true ? (Time.now.utc + 3600).hour : Time.now.utc.hour
  end

  def get_newyork_time
    dst == true ? (Time.now.utc - 3600*4).hour : (Time.now.utc - 3600*5).hour
  end

  def get_tokio_time
    (Time.now.utc + (3600 * 9)).hour
  end

  def get_sydney_time
    dst == true ? (Time.now.utc + 3600*11).hour : (Time.now.utc + 3600*10).hour
  end
end

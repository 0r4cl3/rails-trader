class CandlesController < ApplicationController

  before_action { @client = OandaAPI::Client::TokenClient.new(:practice, Rails.application.secrets.oanda_token) }  
  before_action { @account_number = Rails.application.secrets.oanda_account }
  
  def index
    @granularity = params[:granularity] || 'M15'
    @count = params[:count] || 100
    @instrument = params[:instrument] || 'EUR_USD'
    @candles = GetCandles.new(@client, instrument: @instrument, granularity: @granularity, count: @count).fetch_candles
  end
  
end

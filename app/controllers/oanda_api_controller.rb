class OandaApiController < ApplicationController 
  
  before_action { @client = OandaAPI::Client::TokenClient.new(:practice, Rails.application.secrets.oanda_token) }  
  before_action { @account_number = Rails.application.secrets.oanda_account }

  def index
  end

  def calendar
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

  def account_info
    @account = GetInfo.new(@client, @account_number).fetch_client_info
    @open_orders = @account.open_orders
    @open_trades = @account.open_trades
    @balance = @account.balance
    @account_currency = @account.account_currency
  end


private


end

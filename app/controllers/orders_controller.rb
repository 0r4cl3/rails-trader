class OrdersController < ApplicationController

  before_action { @client = OandaAPI::Client::TokenClient.new(:practice, Rails.application.secrets.oanda_token) }  
  before_action { @account_number = Rails.application.secrets.oanda_account }
  
  def index
  end

  def create
    @order = Order.new(@client, @account_number, instrument: @instrument, type: @type, side: @side, units: @units)
    @order.place

    redirect_to orders_path
  end

  def new
    @instrument = params[:instrument] 
    @type = params[:type] 
    @options_for_type = [['market', 'market']]
    @side = params[:side]
    @options_for_side = [['buy', 'buy'], ['sell', 'sell']]
    @units = params[:units]
  end

end

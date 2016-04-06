class AnalisysController < ApplicationController
  before_action { @client = OandaAPI::Client::TokenClient.new(:practice, Rails.application.secrets.oanda_token) }  
  before_action { @account_number = Rails.application.secrets.oanda_account }

  def index
    @sma10 = Sma.new(@client, 10).sma
    @output = @sma10
    @sma30 = Sma.new(@client, 30).sma
    @output30 = @sma30
  end
end

class AnalisysController < ApplicationController
  before_action { @client = OandaAPI::Client::TokenClient.new(:practice, Rails.application.secrets.oanda_token) }  
  before_action { @account_number = Rails.application.secrets.oanda_account }

  def index
    @rsi = Rsi.new(@client).calculate_rsi
  end
end

class Order
  attr_reader :account
  def initialize (client, account_number, params)
    @client = client
    @account_number = account_number
    @instrument = params[:instrument]
    @type = params[:type]
    @side = params[:side]
    @units = params[:units]
  end

  def place
    @order = client.account(@account_number).order(
                                     instrument: "EUR_USD",
                                     type: "market",
                                     side: "buy",
                                     units: 1_000).create
  end
end




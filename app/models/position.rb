class Position
  attr_reader :client

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
                                     instrument: @instrument,
                                     type: @type,
                                     side: @side,
                                     units: @units).create
  end

  def close
  end
end




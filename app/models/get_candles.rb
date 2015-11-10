class GetCandles
  attr_reader :candles, :client

  def initialize(client, params)
    @granularity = params[:granularity]
    @count = params[:count]
    @client = client
  end

  def fetch_candles
    @candles = client.candles( instrument: "EUR_USD",
                              granularity: @granularity,
                            candle_format: "midpoint",
                                    count: @count).get
  end
end

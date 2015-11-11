class GetCandles
  attr_reader :candles, :client

  def initialize(client, params) 
    @instrument = params[:instrument]
    @granularity = params[:granularity]
    @count = params[:count]
    @client = client
  end

  def fetch_candles
    @candles = client.candles( instrument: @instrument,
                              granularity: @granularity,
                            candle_format: "midpoint",
                                    count: @count).get
  end
end

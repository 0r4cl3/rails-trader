class Rsi
  attr_reader :candles, :client

  def initialize(client, params)
    @granuality = params[:granuality]
    @client = client
  end

  def fetch_candles
    @candles = client.candles( instrument: "EUR_USD",
                              granularity: @granuality,
                            candle_format: "midpoint",
                                    start: (Time.now - (3600*10)).utc.to_datetime.rfc3339).get
  end
end
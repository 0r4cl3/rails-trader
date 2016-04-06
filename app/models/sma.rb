class Sma
  attr_reader :client, :sma_value
  def initialize(client, sma_value)
    @client = client
    @sma_value = sma_value
  end

  def fetch_candles
    @candles = client.candles( instrument: 'EUR_USD',
                              granularity: 'D',
                              candle_format: 'midpoint',
                              count: @sma_value).get
  end

  def sma
    array = []
    fetch_candles.each do |candle|
      array.push candle.close_mid
    end

    count = array.count
    sum = array.inject{|sum, x| sum + x}
    return sum / count
  end
end

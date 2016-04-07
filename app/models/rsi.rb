class Rsi
  attr_reader :client, :candles

  def initialize(client)
    @client = client
  end


  def calculate_rsi

  @candles = client.candles( instrument: 'EUR_USD',
                            granularity: 'D',
                            candle_format: "midpoint",
                            count: '100').get
  
    #n = RSI period
    n = 14

    array = Array.new
    @candles.each do |candle|
      array.unshift candle.close_mid
    end

    gains = Array.new
    losses = Array.new

    array.each_with_index do |value, index|
      if index < (array.count - 1)
        diff = value - array[index + 1]
        if diff < 0
          losses.push diff.abs
        else
          gains.push diff
        end
      end
    end

    losses_n = losses.first(n)
    gains_n = gains.first(n)
    avg_loss_n = losses_n.inject {|sum, x| sum + x} / n
    avg_gain_n = gains_n.inject {|sum, x| sum + x} / n

    rs = avg_gain_n / avg_loss_n

    return 100 - (100 / (rs + 1))
  end




end

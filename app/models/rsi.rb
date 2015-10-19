class Rsi
  def initialize(candles)
    @candles = candles
  end

  def calculate_rsi
    @close_price_container = []
    @candles.each do |c|
      @close_price_container  << c.close_mid
    end

    sum = @close_price_container.inject {|sum, x| sum + x}
    return sum / @close_price_container.count
  end

end
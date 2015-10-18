class Market
  attr_reader :location_time

  def initialize(location_time)
    @location_time = location_time
  end

  def open?
    @location_time.hour >= 8 && @location_time.hour < 17 ?  "open" : "closed"
  end
end

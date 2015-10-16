class GetTime

  def initialize
    @time = Time.now
  end

  def is_dst
    Time.now.dst?
  end

  def london
    is_dst == true ? Time.now.utc + 3600 : Time.now.utc
  end

  def newyork
    is_dst == true ? Time.now.utc - 3600*4 : Time.now.utc - 3600*5
  end

  def tokio
    Time.now.utc + 3600*9
  end

  def sydney
    is_dst == true ? Time.now.utc + 3600*11 : Time.now.utc + 3600*10
  end

end
class Player
  attr_accessor :name, :symbol

  def initialize(n, s)
    @name = n
    @symbol = s
  end

  def info
    "#{name} picked #{symbol} symbol"
  end

end
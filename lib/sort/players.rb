# This class creates players
class Player
  attr_accessor :name, :symbol

  def initialize(nam, sym)
    @name = nam
    @symbol = sym
  end

  def info
    "#{name} picked #{symbol} symbol"
  end
end

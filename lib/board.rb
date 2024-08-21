class Board
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3) }
  end
end


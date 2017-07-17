require './lib/board_builder'
require './lib/space'

class Board

  attr_reader :board

  def initialize(size)
    @size = size
    @board = board
  end

  include BoardBuilder

end

board = Board.new(4)

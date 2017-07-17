require './lib/board_builder'
require './lib/space'

class Board

  attr_reader :board

  def initialize(size)
    @size = size
    @board = build_final_grid
  end

  include BoardBuilder

end

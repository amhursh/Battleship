require './lib/board_builder'
require './lib/space'
require './lib/ship'

class Board

  attr_reader :game_board,
              :size

  def initialize(size)
    @size = size
    @game_board = build_final_grid
  end

  include BoardBuilder

end

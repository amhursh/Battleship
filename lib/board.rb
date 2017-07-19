require './lib/board_builder'
require './lib/space'
require './lib/ship'

class Board

  attr_reader :game_board,
              :size

  def initialize(size)
    @size = size
    @game_board = build_final_game_board
  end

  include BoardBuilder

end

# board = Board.new(4)
# p board.game_board
# p board.build_final_game_board

require './lib/game'
require './lib/board'

class Player

  attr_reader :player_board,
              :shells_fired,
              :ships

  def initialize(size)
    @player_board = Board.new(size)
    @shells_fired = 0
    @ships = []
  end

  def determine_ships
    if size == 4
      @ships =
  end

end

# require './lib/game'
require './lib/board'
require './lib/ship'

class Player

  attr_reader :player_board,
              :shells_fired,
              :player_ships,
              :board_size

  def initialize(board_size)
    @board_size = board_size
    @player_board = Board.new(board_size)
    @shells_fired = 0
    @player_ships = []
  end

  def determine_ships
    if board_size == 4
      @player_ships = [Ship.new(2), Ship.new(3)]
    elsif board_size == 8
      @player_ships = [Ship.new(2), Ship.new(3), Ship.new(4)]
    elsif board_size == 12
      @player_ships = [Ship.new(2), Ship.new(3), Ship.new(4), Ship.new(5)]
    end
  end

  extend Validation

end

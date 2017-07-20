require './lib/board'
require './lib/ship'
require './lib/space'
require './lib/validation'
require './lib/communication'

require 'pry'

class Player

  include Validation

  include Communication

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

  def determine_ships(player_ships = @player_ships)
    if board_size == 4
      player_ships = [Ship.new(2), Ship.new(3)]
    elsif board_size == 8
      player_ships = [Ship.new(2), Ship.new(3), Ship.new(4)]
    elsif board_size == 12
      player_ships = [Ship.new(2), Ship.new(3), Ship.new(4), Ship.new(5)]
    end
  end

  def place_two_unit_ship(coordinates, board = @player_board, ships = @player_ships)
    if coordinates.split.count == 2 && valid_coordinates_location?(coordinates, board) && !any_spaces_occupied?(coordinates, board)
      coordinates.split.each do |coordinate|
        board.game_board[coordinate].add_ship(ships[0])
      end
    elsif board == @player_board
      Communication.invalid_menu_choice_message
    else
      nil
    end
  end

  def place_three_unit_ship(coordinates, board = @player_board, ships = @player_ships)
    if coordinates.split.count == 3 && valid_coordinates_location?(coordinates, board) && !any_spaces_occupied?(coordinates, board)
      coordinates.split.each do |coordinate|
        board.game_board[coordinate].add_ship(ships[0])
      end
    else
      Communication.invalid_menu_choice_message
    end
  end

  def place_four_unit_ship(coordinates, board = @player_board, ships = @player_ships)
    if coordinates.split.count == 4 && valid_coordinates_location?(coordinates, board) && !any_spaces_occupied?(coordinates, board)
      coordinates.split.each do |coordinate|
        board.game_board[coordinate].add_ship(ships[0])
      end
    else
      Communication.invalid_menu_choice_message
    end
  end

  def place_five_unit_ship(coordinates, board = @player_board, ships = @player_ships)
    if coordinates.split.count == 5 && valid_coordinates_location?(coordinates, board) && !any_spaces_occupied?(coordinates, board)
      coordinates.split.each do |coordinate|
        board.game_board[coordinate].add_ship(ships[0])
      end
    else
      Communication.invalid_menu_choice_message
    end
  end

end

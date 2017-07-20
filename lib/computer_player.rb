require './lib/player'
require './lib/validation'
require './lib/board'
require 'pry'

class ComputerPlayer < Player

include Validation

  attr_reader :computer_board,
              :shells_fired,
              :computer_ships,
              :board_size

  def initialize(board_size)
    @board_size = board_size
    @computer_board = Board.new(board_size)
    @shells_fired = 0
    @player_ships = []
  end

  def random_starting_coordinate_for_ship
    output_coordinates = []
    coordinates = computer_board.game_board.keys
    output_coordinates << coordinates.delete_at(rand(coordinates.length))
  end

  def random_coordinates_for_two_unit_ship(ship_length)
    starting_coord = random_starting_coordinate_for_ship[0]
    output_coordinates = [starting_coord]
    coordinates = get_all_possible_col_and_row_values(starting_coord, @computer_board, ship_length)
    output_coordinates << coordinates.delete_at(rand(coordinates.length))
    output_coordinates
  end

  def random_coordinates_for_three_unit_ship(ship_length)
    starting_coords = random_coordinates_for_two_unit_ship(2).sort
    flag = find_liner_upper(starting_coords)
    index = flag_index(starting_coords, flag)
    possible_coords = starting_coords.map do |coord|
      get_all_possible_col_and_row_values(coord, @computer_board, ship_length)
    end
    final_coords = possible_coords.flatten.uniq.delete_if do |coord|
      coord[index] != flag
    end
    final_coords = final_coords.sort
    if rand.round == 0
      final_coords = final_coords - [final_coords.last]
      return final_coords
    else
      final_coords = final_coords - [final_coords.first]
      return final_coords
    end
  end

  def random_coordinates_for_four_unit_ship(ship_length)
    starting_coords = random_coordinates_for_three_unit_ship(3).sort
    flag = find_liner_upper(starting_coords)
    index = flag_index(starting_coords, flag)
    possible_coords = starting_coords.map do |coord|
      get_all_possible_col_and_row_values(coord, @computer_board, ship_length)
    end
    final_coords = possible_coords.flatten.uniq.delete_if do |coord|
      coord[index] != flag
    end
    final_coords = final_coords.sort
    until final_coords.count == 4
      if rand.round == 0
        final_coords = final_coords - [final_coords.last]
      else
        final_coords = final_coords - [final_coords.first]
      end
    end
    final_coords
  end

  def find_liner_upper(starting_coords)
    starting_coords = starting_coords.map { |coord| coord.split("", 2) }
    starting_coords = starting_coords.flatten.sort
    freq = starting_coords.inject(Hash.new(0)) { |h, v| h[v] += 1; h }
    starting_coords.max_by { |v| freq[v] }
  end

  def flag_index(starting_coords, flag)
    return 0 if (starting_coords[0][0] == flag)
    return 1 if (starting_coords[0][1..2] == flag)
  end

end

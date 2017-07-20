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

  def random_coordinates_for_longer_ships(ship_length)

  end


  # def random_starting_coordinate_for_ship(ship_length, output_coordinates = ["X1", "Z9"])
  #   until ((output_coordinates.count + 2) == (ship_length + 2)) && ((coordinates_are_connected_in_column?(string_splitter(output_coordinates))) || (coordinates_are_connected_in_row?(string_splitter(output_coordinates))))
  #     # binding.pry
  #     (output_coordinates = output_coordinates[0..-3]) if (output_coordinates == (ship_length + 2))
  #     coordinates = computer_board.game_board.keys
  #     output_coordinates << coordinates.delete_at(rand(coordinates.length))
  #     output_coordinates
  #   end
  # end

  # def string_splitter(array)
  #   x = (array.count - 1)
  #   results = array.map do |coordinate|
  #     if x > 0
  #       x -= 1
  #       coordinate + " "
  #     else
  #       coordinate
  #     end
  #   end.join
  # end

  # def add_coordinates_for_ship(length_of_ship)
  #   output = random_starting_coordinate_for_ship
  #   coordinates = computer_board.game_board.keys - output
  #   (length_of_ship - 1).times do
  #     target_coord = [coordinates.delete_at(rand(coordinates.length))]
  #     binding.pry
  #     potential_coords = (target_coord + output).flatten.join(" ")
  #     if coordinates_are_connected_in_row?(potential_coords) || coordinates_are_connected_in_column?(potential_coords)
  #       output = potential_coords
  #     end
  #   end
  #   output
  # end

end

player = Player.new(4)
player.determine_ships
computer = ComputerPlayer.new(4)
computer.determine_ships
# p computer.random_starting_coordinate_for_ship
p computer.computer_board.build_board_hash_with_columns
p computer.computer_board.build_board_hash_with_rows
p computer.random_coordinates_for_two_unit_ship(2)
# computer.place_two_unit_ship(number_of_coordinates)
# p computer.add_coordinates_for_ship(2)
# p computer.string_splitter(["A1", "A2"])
# p computer.string_splitter(["A1", "A2", "A3"])

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_player'
require './lib/player'
require './lib/validation'

class ComputerPlayerTest < Minitest::Test

  def test_computer_player_exists
    computer = ComputerPlayer.new(4)

    assert_instance_of ComputerPlayer, computer
  end

  def test_computer_initializes_with_board_size
    computer = ComputerPlayer.new(4)

    assert_equal 4, computer.board_size
  end

  def test_computer_initializes_with_no_shells_fired
    computer = ComputerPlayer.new(4)

    assert_equal 0, computer.shells_fired
  end

  def test_computer_can_have_ships
    computer = ComputerPlayer.new(4)

    assert_equal [], computer.player_ships

    computer.determine_ships

    assert_equal 2, computer.player_ships.count
  end

  def test_computer_has_game_board
    computer = ComputerPlayer.new(4)

    assert_instance_of Board, computer.computer_board
  end

  def test_computer_can_create_random_starting_coordinate
    computer = ComputerPlayer.new(4)
    coord = computer.random_starting_coordinate_for_ship

    assert_equal 1, coord.count
  end

  def test_computer_can_get_coordinates_for_two_unit_ship
    computer = ComputerPlayer.new(4)
    coords = computer.random_coordinates_for_two_unit_ship(2)

    assert_equal 2, coords.count
  end

  def test_computer_can_get_coordinates_for_three_unit_ship
    computer = ComputerPlayer.new(4)
    coords = computer.random_coordinates_for_three_unit_ship(3)

    assert_equal 3, coords.count

    computer2 = ComputerPlayer.new(4)
    coords2 = computer2.random_coordinates_for_three_unit_ship(3)

    assert_equal 3, coords.count
  end

  def test_computer_can_get_coordinates_for_four_unit_ship
    computer = ComputerPlayer.new(8)
    coords = computer.random_coordinates_for_four_unit_ship(4)

    assert_equal 4, coords.count
  end

  def test_computer_coordinate_liner_upper
    computer = ComputerPlayer.new(8)
    coords = ["A1", "A2", "A3"]
    coords2 = ["A1", "B1", "C1"]

    assert_equal "A", computer.find_liner_upper(coords)
    assert_equal "1", computer.find_liner_upper(coords2)
  end

  def test_computer_can_build_flag_index
    computer = ComputerPlayer.new(8)
    starting_coords = ["A1", "A2", "A3"]
    flag = computer.find_liner_upper(["A1", "A2", "A3"])

    assert_equal 0, computer.flag_index(starting_coords, flag)

    starting_coords2 = ["A1", "B1", "C1"]
    flag2 = computer.find_liner_upper(["A1", "B1", "C1"])

    assert_equal 1, computer.flag_index(starting_coords2, flag2)
  end


end

require 'simplecov'
SimpleCov.start

require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/validation'
require './lib/player'
require './lib/computer_player'
require './lib/board'

class ValidationTest < Minitest::Test

  include Validation

  def test_that_checks_board_for_spaces
    player = Player.new(4)

    assert player.coordinates_are_in_board?("A4 A1")
    refute player.coordinates_are_in_board?("A1 A5")

    player2 = Player.new(8)

    assert player2.coordinates_are_in_board?("A4 H8")
    refute player2.coordinates_are_in_board?("A1 A12")
  end

  def test_coordinate_count
    player = Player.new(4)

    assert_equal 2, player.count_coordinates("A3 A4")
    assert_equal 3, player.count_coordinates("A2 A3 A4")
  end

  def test_broken_down_coordinate_array_for_rows
    player = Player.new(4)
    length = player.count_coordinates("A2 A3 A4")

    assert_equal [[2, 3, 4], ["A", "A", "A"]], player.break_down_coordinate_array_for_rows("A2 A3 A4", length)

    player2 = Player.new(4)
    length2 = player.count_coordinates("A3 A4")

    assert_equal [[3, 4], ["A", "A"]], player.break_down_coordinate_array_for_rows("A3 A4", length2)
  end

  def test_broken_down_coordinate_array_for_columns
    player = Player.new(4)
    length = player.count_coordinates("A1 B1 C1")

    assert_equal [["1", "1", "1"], [65, 66, 67]], player.break_down_coordinate_array_for_columns("A1 B1 C1", length)
  end

  def test_same_row
    player = Player.new(4)

    assert player.same_row?(["A", "A", "A"])
    refute player.same_row?(["A", "A", "B"])
  end

  def test_same_column
    player = Player.new(4)

    assert player.same_column?(["1", "1", "1"])
    refute player.same_column?(["1", "2", "2"])
  end

  def test_columns_consecutive
    player = Player.new(4)

    assert player.consecutive?([1, 2, 3])
    refute player.consecutive?([1, 2, 4])
    assert player.consecutive?([3, 4, 5, 6, 7])
    refute player.consecutive?([4, 1, 5, 9, 10])
  end

  def test_coordinates_are_connected_in_a_row
    player = Player.new(4)

    assert player.coordinates_are_connected_in_row?("A1 A2")
    refute player.coordinates_are_connected_in_row?("A1 B2")
    assert player.coordinates_are_connected_in_row?("D2 D3 D4")
    refute player.coordinates_are_connected_in_row?("D4 C3 B2")

    player2 = Player.new(12)

    assert player.coordinates_are_connected_in_row?("A11 A12")
    refute player.coordinates_are_connected_in_row?("A12 C12")
  end

  def test_coordinates_are_connected_in_a_column
    player = Player.new(4)

    assert player.coordinates_are_connected_in_column?("A1 B1")
    refute player.coordinates_are_connected_in_column?("A1 B2")
    assert player.coordinates_are_connected_in_column?("A2 B2 C2")
    refute player.coordinates_are_connected_in_column?("A1 B1 C2")
  end

  def test_ascii_conversion
    player = Player.new(4)

    assert_equal [65, 66], player.get_ascii_for_chars_in_array(["A", "B"])
    assert_equal [65, 66, 67], player.get_ascii_for_chars_in_array(["A", "B", "C"])
  end

  def test_valid_coordinates_location
    player = Player.new(4)

    assert player.valid_coordinates_location?("A1 A2")
    assert player.valid_coordinates_location?("A1 B1")
    assert player.valid_coordinates_location?("C3 C4")
    assert player.valid_coordinates_location?("D4 C4")
    refute player.valid_coordinates_location?("A1 A3")
    refute player.valid_coordinates_location?("A1 B2")
    refute player.valid_coordinates_location?("D4 D1")
    refute player.valid_coordinates_location?("C3 D4")

    player = Player.new(8)

    assert player.valid_coordinates_location?("A1 A2 A3")
    assert player.valid_coordinates_location?("A1 B1 C1")
    assert player.valid_coordinates_location?("C3 C4 C2")
    assert player.valid_coordinates_location?("D4 C4 B4")
    refute player.valid_coordinates_location?("A1 A3 A4")
    refute player.valid_coordinates_location?("A1 B2 B3")
    refute player.valid_coordinates_location?("D4 D1 D2")
    refute player.valid_coordinates_location?("C3 D4 B2")
  end

  def test_if_space_is_occupied
    player = Player.new(4)
    player.place_two_unit_ship("A1 A2")

    assert player.any_spaces_occupied?("A1 A2")
    assert player.any_spaces_occupied?("A2 B2 C2")
    assert player.any_spaces_occupied?("B1 C1 A1")
    refute player.any_spaces_occupied?("B1 C1")
  end

  def test_possible_row_values_for_coordinate
    computer = ComputerPlayer.new(4)
    start = "A4"
    board = computer.computer_board
    results = get_possible_row_values(start, board)
    modified_results = results.map { |x| x[0]}
    modified_results = modified_results.uniq

    assert_equal ["A"], modified_results
  end

  def test_possible_col_values_for_coordinate
    computer = ComputerPlayer.new(4)
    start = "A4"
    board = computer.computer_board
    results = get_possible_col_values(start, board)
    modified_results = results.map { |x| x[1]}
    modified_results = modified_results.uniq

    assert_equal ["4"], modified_results
  end

  def test_all_possible_col_and_row_values
    computer = ComputerPlayer.new(4)
    start = "A3"
    board = computer.computer_board
    length = 2
    results = get_all_possible_col_and_row_values(start, board, length)

    assert_equal ["A2", "A4", "B3"], results
  end
end

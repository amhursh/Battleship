require 'simplecov'
SimpleCov.start

require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/validation'
require './lib/player'

class ValidationTest < Minitest::Test

  include Validation

  def test_that_checks_board_for_spaces
    player = Player.new(4)

    assert player.check_if_coordinates_are_in_board("A4 A1")
    refute player.check_if_coordinates_are_in_board("A1 A5")

    player2 = Player.new(8)

    assert player2.check_if_coordinates_are_in_board("A4 H8")
    refute player2.check_if_coordinates_are_in_board("A1 A12")
  end

  def test_coordinate_count
    player = Player.new(4)

    assert_equal 2, player.count_coordinates("A3 A4")
    assert_equal 3, player.count_coordinates("A2 A3 A4")
  end

  def test_broken_down_coordinate_array
    player = Player.new(4)
    length = player.count_coordinates("A2 A3 A4")

    assert_equal [[2, 3, 4], ["A", "A", "A"]], player.break_down_coordinate_array("A2 A3 A4", length)

    player2 = Player.new(4)
    length2 = player.count_coordinates("A3 A4")

    assert_equal [[3, 4], ["A", "A"]], player.break_down_coordinate_array("A3 A4", length2)
  end

  def test_same_row
    player = Player.new(4)

    assert player.same_row?(["A", "A", "A"])
    refute player.same_row?(["A", "A", "B"])
  end

end

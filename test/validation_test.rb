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

end

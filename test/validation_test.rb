require 'simplecov'
SimpleCov.start

require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'

class ValidationTest < Minitest::Test

  def test_that_checks_board_for_spaces
    player = Player.new(4)
    binding.pry
    assert player.check_if_coordinates_are_in_board("A4 A5")
  end

end

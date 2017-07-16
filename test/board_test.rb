require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'

class CompleteMeTest < Minitest::Test

  def test_that_board_exists
    board = Board.new(4)
    assert_instance_of Board, board
  end

end

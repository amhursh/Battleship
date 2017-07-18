require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test

  def test_game_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_game_starts_with_welcome_and_main_menu
    game = Game.new
    assert_equal nil, game.game_start
  end


end

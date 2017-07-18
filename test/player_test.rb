require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_player_exists
    player_one = Player.new(4)
    assert_instance_of Player, player_one
  end

  def test_player_has_fired_no_shells_at_start
    player_one = Player.new(4)
    assert_equal 0, player_one.shells_fired
  end

  def test_player_has_ships
    player_one = Player.new(4)
    player_one.determine_ships
    assert_equal 2, player_one.player_ships.count

    player_one = Player.new(8)
    player_one.determine_ships
    assert_equal 3, player_one.player_ships.count

    player_one = Player.new(12)
    player_one.determine_ships
    assert_equal 4, player_one.player_ships.count
  end

  def test_board_size
    player_one = Player.new(4)
    assert_equal 4, player_one.board_size
  end

end

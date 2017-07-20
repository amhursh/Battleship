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

  def test_player_places_ships
    player_one = Player.new(4)
    player_one.place_two_unit_ship("A3 A4")
    player_one.place_three_unit_ship("D2 D3 D1")

    assert player_one.player_board.game_board["A3"].occupied[0]
    assert player_one.player_board.game_board["A4"].occupied[0]
    assert player_one.player_board.game_board["D1"].occupied[0]
    assert player_one.player_board.game_board["D2"].occupied[0]
    assert player_one.player_board.game_board["D3"].occupied[0]

    player_two = Player.new(12)
    player_two.place_four_unit_ship("D4 E4 F4 G4")
    player_two.place_five_unit_ship("L1 L2 L3 L5 L4")

    assert player_two.player_board.game_board["D4"].occupied[0]
    assert player_two.player_board.game_board["E4"].occupied[0]
    assert player_two.player_board.game_board["F4"].occupied[0]
    assert player_two.player_board.game_board["G4"].occupied[0]
    assert player_two.player_board.game_board["L1"].occupied[0]
    assert player_two.player_board.game_board["L2"].occupied[0]
    assert player_two.player_board.game_board["L3"].occupied[0]
    assert player_two.player_board.game_board["L4"].occupied[0]
    assert player_two.player_board.game_board["L5"].occupied[0]
  end

  def test_player_invalid_ship_placement
    player_one = Player.new(4)
    expected = player_one.place_two_unit_ship("A3 B2")

    assert_equal "Invalid choice. Please try again.\n", expected

    player_two = Player.new(4)
    player_two.place_two_unit_ship("A1 A2")
    expected2 = player_two.place_three_unit_ship("A2 B2 C2")

    assert_equal "Invalid choice. Please try again.\n", expected2

    player_three = Player.new(12)
    player_three.place_two_unit_ship("A1 A2")
    expected3 = player_three.place_four_unit_ship("A2 B2 C2")
    expected4 = player_three.place_five_unit_ship("F1 D2 G4 A1 A2")

    assert_equal "Invalid choice. Please try again.\n", expected3
    assert_equal "Invalid choice. Please try again.\n", expected4
  end

end

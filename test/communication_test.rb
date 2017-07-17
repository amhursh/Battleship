require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/communication'

class CommunicationTest < Minitest::Test

  def test_welcome_message
    welcome = Communication.welcome
    assert_equal "Welcome to Battleship\n\n", welcome
  end

  def test_main_menu
    main = Communication.main_menu
    assert_equal "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n>", main
  end

  def test_computer_placement_message
    message = Communication.computer_placing_ships
    assert_equal "Computer is now placing ships...", message
  end

  def test_player_placement_message
    message = Communication.player_placing_ships
    assert_equal "I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first is two units long and the\nsecond is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nEnter the squares for the two-unit ship:\n", message
  end

  

end

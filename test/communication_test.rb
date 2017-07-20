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

  def test_invalid_main_menu_choice
    message = Communication.invalid_menu_choice_message
    assert_equal "Invalid choice. Please try again.\n", message
  end

  def test_select_difficulty_menu
    message = Communication.select_difficulty_menu
    assert_equal "Would you like to engage in an (e)asy, (i)ntermediate, or (d)ifficult?\n>", message
  end

  def test_instructions
    instructions = Communication.instructions
    assert_equal "Battleship is a game of naval warfare. " \
      "I will place my ships in a grid and you will do the same. " \
      "Neither of us will know the location of each other's ships. " \
      "Ships occupy between 2 to 5 spaces on the grid. " \
      "We will then take turns shelling the other's grid, hoping to hit a ship. " \
      "When a shell misses, it will be marked on the grid with an 'M'. " \
      "When a shell hits a ship, it will be marked on the grid with an 'H'. " \
      "When all spaces occupied by a ship have been hit, that ship will be marked " \
      "'S' for sunk. The first player to sink all ships wins the war.\n", instructions
  end

  def test_computer_placement_message
    message = Communication.computer_placing_ships
    assert_equal "Computer is now placing ships...", message
  end

  def test_player_placement_message_two_space_unit
    message = Communication.player_placing_2_unit_ship
    assert_equal "I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first is two units long and the\nsecond is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nEnter the squares for the two-unit ship:\n", message
  end

  def test_player_placement_message_two_space_unit
    message = Communication.player_placing_3_unit_ship
    assert_equal "Enter the coordinates for the three unit ship:\n>", message
  end

  def test_invalid_placement_message
    message = Communication.invalid_placement_message
    assert_equal "You have chosen an invalid placement.\nYou must enter the coordinates in the correct format.\nExample: A4 B4.\n", message
  end

  def test_quit_game_message
    message = Communication.quit_game
    assert_equal "Goodbye!", message
  end

end

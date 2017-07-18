require './lib/board'

class Communication

  def self.welcome
    "Welcome to Battleship\n\n"
  end

  def self.main_menu
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n>"
  end

  def self.quit_game
    "Goodbye!"
  end

  def self.invalid_menu_choice_message
    "Invalid choice. Please try again.\n"
  end

  def self.select_difficulty_menu
    "Would you like to engage in an (e)asy, (i)ntermediate, or (d)ifficult?\n>"
  end

  def self.instructions
  "Battleship is a game of naval warfare. " \
  "I will place my ships in a grid and you will do the same. " \
  "Neither of us will know the location of each other's ships. " \
  "Ships occupy between 2 to 5 spaces on the grid. " \
  "We will then take turns shelling the other's grid, hoping to hit a ship. " \
  "When a shell misses, it will be marked on the grid with an 'M'. " \
  "When a shell hits a ship, it will be marked on the grid with an 'H'. " \
  "When all spaces occupied by a ship have been hit, that ship will be marked " \
  "'S' for sunk. The first player to sink all ships wins the war.\n"
  end

  def self.computer_placing_ships
    "Computer is now placing ships..."
  end

  def self.player_placing_2_unit_ship
    "I have laid out my ships on the grid. " \
    "You now need to layout your ships." \
    "The first is two units long." \
    "The grid has A1 at the top left and D4 at the bottom right.\n" \
    "Enter the coordinates for the two-unit ship:\n>"
  end

  def self.player_placing_3_unit_ship
    "Enter the coordinates for the three unit ship:\n>"
  end

  def self.invalid_placement_message
    "You have chosen an invalid placement.
You must enter the coordinates in the correct format.
Example: A4 B4.\n"
  end

end

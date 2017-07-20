require './lib/board'
require './lib/player'
require './lib/computer_player'
require './lib/validation'
require './lib/communication'

class Game

  attr_accessor :size,
                :player,
                :computer

  def initialize
    @size = 0
    @player = nil
    @computer = nil
  end

  def game_start
    puts Communication.welcome
  end

  def main_menu_notification
    puts Communication.main_menu
  end

  def main_menu_interaction
    choice = gets.chomp.downcase
    if choice == 'q' || choice == 'quit'
      puts Communication.quit_game
      exit
    elsif choice == 'i' || choice == 'instructions'
      puts Communication.instructions
      main_menu_notification
      main_menu_interaction
    elsif choice == 'p' || choice == 'play'
      difficulty_menu_interaction
    else
      puts Communication.invalid_menu_choice_message
      main_menu_interaction
    end
  end


  def difficulty_menu_interaction
    puts Communication.select_difficulty_menu
    choice = gets.chomp
    if choice == "e" || choice == "easy"
      @size = 4
    elsif choice == "i" || choice == "intermediate"
      @size = 8
    elsif choice == "d" || choice == "difficult"
      @size = 12
    else
      puts Communication.invalid_menu_choice_message
      difficulty_menu_interaction
    end
  end

  def generate_players
    @player = Player.new(@size)
    @computer = ComputerPlayer.new(@size)
  end

  def add_ships_to_inventory
    player.determine_ships(player.player_ships)
    computer.determine_ships(computer.computer_ships)
  end

  def computer_place_ships
    if @size == 4
      computer.place_two_unit_ship((computer.random_coordinates_for_two_unit_ship(2).join(" ")), computer.computer_board, computer.computer_ships)
      coords_two = computer.random_coordinates_for_three_unit_ship(3).join(" ")
      while !computer.valid_coordinates_location?(coords_two, computer.computer_board)
        coords_two = computer.random_coordinates_for_three_unit_ship(3).join(" ")
      end
      computer.place_three_unit_ship((coords_two), computer.computer_board, computer.computer_ships)
    elsif @size == 8
      computer.place_two_unit_ship((computer.random_coordinates_for_two_unit_ship(2).join(" ")), computer.computer_board, computer.computer_ships)
      coords_three = computer.random_coordinates_for_three_unit_ship(3).join(" ")
      while !computer.valid_coordinates_location?(coords_three, computer.computer_board)
        coords_three = computer.random_coordinates_for_three_unit_ship(3).join(" ")
      end
      computer.place_three_unit_ship((coords_three), computer.computer_board, computer.computer_ships)
      coords_four = computer.random_coordinates_for_four_unit_ship(3).join(" ")
      while !computer.valid_coordinates_location?(coords_four, computer.computer_board)
        coords_four = computer.random_coordinates_for_four_unit_ship(3).join(" ")
      end
      computer.place_four_unit_ship((coords_four), computer.computer_board, computer.computer_ships)
    end
    binding.pry
  end

    # computer places ships
      # validate placement
      # if valid
        # update computer board
      # else
        # computer places ships again
    # player places ships
      # validate placement
      # if valid:
        # update player board
      # else:
        # notify player of invalid placement
        # return to player places ships

  # main phase

    # DISPLAY attack ascii board
    # DISPLAY defend ascii board

    # player fires
    # check against computer board for hit or miss
    # if miss:
      # update computer board
      # update attack ascii board with 'm'
    # if hit:
      # update computer board
      # update attack ascii board with 'h'
      # if ship is sunk, tell player size of ship sunk and:
        # if last ship has been sunk, go to end-game phase
    # DISPLAY updated attack ascii board

    # computer fires
    # check against player board for hit or miss
    # if hit:
      # update player board
      # update defend ascii board with 'h'
      # if ship sunk, tell player thier ship has been sunk and the type of ship
        # if last ship sunk, go to end-game phase
    # if miss:
      # update player board
      # update defend ascii board with 'm'
    # DISPLAY updated defend ascii board

    # repeat player fires and computer fires in turn until:
    # all ships sunk --> go to end game phase

  # end game phase

    # if player lost:
      # print commiseration message
      # print number of shots taken by computer to win
      # print ammount of time played
    # if player won:
      # print congratulation message
      # print number of shots taken by player to win
      # print ammount of time played

end

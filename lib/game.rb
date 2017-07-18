require './lib/board'
require './lib/player'
require './lib/computer_player'
require './lib/communication'

class Game

  attr_accessor :size

  def initialize
    @size = 0
  end

# start game
# main menu

  def game_start
    puts Communication.welcome
  end

  def main_menu_notification
    puts Communication.main_menu
  end

# player chooses:
  # quit
  # instructions
  # play

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

# if play...
  # player chooses difficulty

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
      # difficulty_menu_interaction
    end
  end


  # setup phase

  def generate_players
    player = Player.new(@size)
    computer = ComputerPlayer.new(@size)
  end


    # generates blank boards for given size
      # one computer board
      # one player board
    # generates computer ships (number of ships dependent on difficulty)
    # generates player ships (number of ships dependent on difficulty)

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

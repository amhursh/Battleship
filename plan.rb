# start game

# main menu
# player chooses:
  # quit
  # instructions
  # play
# if play...

  # player chooses difficulty

  # setup phase

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

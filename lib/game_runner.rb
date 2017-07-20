require './lib/game'
require 'pry'

class GameRunner

  game = Game.new

  game.game_start
  game.main_menu_notification
  game.main_menu_interaction
  game.generate_players
  game.add_ships_to_inventory
  p game.computer_place_ships


end

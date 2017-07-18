require './lib/game'
require 'pry'

class GameRunner

  game = Game.new

  game.game_start
  game.main_menu_notification
  game.main_menu_interaction
  game.difficulty_menu_interaction
  p game.generate_players


end

module Validation

  def check_if_coordinates_are_in_board(coordinates)
    given_coordinates = coordinates.split
    board_coordinates = @player_board.split_board_labels_by_row.flatten
    board_coordinates.any? do |coordinate|
      given_coordinates.include?(coordinate)
    end
  end

  def coordinate_check(coordinates)

  end




end

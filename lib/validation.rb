module Validation

  def check_if_coordinates_are_in_board(coordinates)
    given_coordinates = coordinates.split
    board_coordinates = @player_board.split_board_labels_by_row.flatten
    (given_coordinates - board_coordinates).empty?
  end

  def check_if_coordinates_are_connected(coordinates)
    given
  end



end

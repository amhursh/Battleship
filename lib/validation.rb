require 'pry'

module Validation

  def check_if_coordinates_are_in_board(coordinates)
    given_coordinates = coordinates.split
    board_coordinates = @player_board.split_board_labels_by_row.flatten
    (given_coordinates - board_coordinates).empty?
  end

  def check_if_coordinates_are_connected_in_row(coordinates)
    length = count_coordinates(coordinates)
    organized = break_down_coordinate_array(coordinates, length)
    return true if same_row?(organized[1]) && (organized[0].each_cons())

  end

  def consecutive?(array)
    
  end

  def same_row?(array)
    array.uniq.length == 1
  end

  def count_coordinates(coordinates)
    coordinate_count = coordinates.split.count
  end

  def break_down_coordinate_array(coordinates, length)
    organized = coordinates.gsub(/\s+/, "").split("").sort.each_slice(length).to_a
    organized[0] = organized[0].map do |num|
      num.to_i
    end
    organized
  end



end

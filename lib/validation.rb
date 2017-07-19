require 'pry'

module Validation

  def coordinates_are_in_board?(coordinates)
    given_coordinates = coordinates.split
    board_coordinates = @player_board.split_board_labels_by_row.flatten
    (given_coordinates - board_coordinates).empty?
  end

  def coordinates_are_connected_in_row?(coordinates)
    length = count_coordinates(coordinates)
    organized = break_down_coordinate_array_for_rows(coordinates, length)
    same_row?(organized[1]) && consecutive?(organized[0])
  end

  def coordinates_are_connected_in_column?(coordinates)
    length = count_coordinates(coordinates)
    organized = break_down_coordinate_array_for_columns(coordinates, length)
    same_column?(organized[0]) && consecutive?(organized[1])
  end

  def valid_coordinates_location?(coordinates)
    coordinates_are_in_board?(coordinates) && (
    coordinates_are_connected_in_row?(coordinates) ||
    coordinates_are_connected_in_column?(coordinates)
    )
  end

  def consecutive?(array)
    array.each_cons(2).all? do |x, y|
      y == x + 1
    end
  end

  def same_row?(array)
    array.uniq.length == 1
  end

  def same_column?(array)
    array.uniq.length == 1
  end

  def count_coordinates(coordinates)
    coordinate_count = coordinates.split.count
  end

  def break_down_coordinate_array_for_rows(coordinates, length)
    organized = coordinates.gsub(/\s+/, "").split("").sort.each_slice(length).to_a
    organized[0] = organized[0].map do |num|
      num.to_i
    end
    organized
  end

  def break_down_coordinate_array_for_columns(coordinates, length)
    organized = coordinates.gsub(/\s+/, "").split("").sort.each_slice(length).to_a
    organized[1] = get_ascii_for_chars_in_array(organized[1])
    organized
  end

  def get_ascii_for_chars_in_array(array)
    array.map do |char|
      char.ord
    end
  end

end

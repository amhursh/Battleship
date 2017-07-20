require 'pry'
require './lib/board_builder'

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

  def any_spaces_occupied?(coordinates)
    results = []
    coordinates.split.each do |coordinate|
      results << @player_board.game_board[coordinate].occupied[0]
    end
    results.include?(true)
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
    # organized = coordinates.gsub(/\s+/, "").split("").sort.each_slice(length).to_a
    organized = coordinates.split(" ").map { |coord| coord.split("", 2) }
    organized = organized.flatten.sort.each_slice(length).to_a
    organized[0] = organized[0].map do |num|
      num.to_i
    end
    organized
  end

  def break_down_coordinate_array_for_columns(coordinates, length)
    organized = coordinates.split(" ").map { |coord| coord.split("", 2) }
    organized = organized.flatten.sort.each_slice(length).to_a
    organized[1] = get_ascii_for_chars_in_array(organized[1])
    organized
  end

  def get_ascii_for_chars_in_array(array)
    array.map do |char|
      char.ord
    end
  end

  def get_possible_row_values(coordinate, board)
    split_coord = coordinate.split("", 2)
    split_coord = [split_coord[0], split_coord[1].to_i]
    rows = board.build_board_hash_with_rows
    rows_poss = rows[split_coord[0]]
  end

  def get_possible_col_values(coordinate, board)
    split_coord = coordinate.split("", 2)
    split_coord = [split_coord[0], split_coord[1].to_i]
    cols = board.build_board_hash_with_columns
    cols_poss = cols[split_coord[1]]
  end

  def get_all_possible_col_and_row_values(coordinate, board, length)
    coordinate_as_array = [coordinate]
    rows_poss = get_possible_row_values(coordinate, board)
    cols_poss = get_possible_col_values(coordinate, board)
    all_poss = rows_poss.zip(cols_poss).flatten.sort.uniq - [coordinate]
    final_all_poss = all_poss.delete_if do |coord|
      (coord[1].to_i < (coordinate_as_array[0][1].to_i - (length - 1))) || (coord[1].to_i > (coordinate_as_array[0][1].to_i + (length - 1)))
    end
    final_all_poss = final_all_poss.delete_if do |coord|
      (coord[0].ord < (coordinate_as_array[0][0].ord - (length - 1))) || (coord[0].ord > (coordinate_as_array[0][0].ord + (length - 1)))
    end
    final_all_poss
  end

end

require 'pry'
module BoardBuilder

  def build_letter_axis
    ("A".."Z").to_a.shift(@size)
  end

  def build_number_axis
    ("1".."26").to_a.shift(@size)
  end

  def build_board_labels
    board_labels = build_letter_axis.map do |letter|
      build_number_axis.map do |number|
        letter + number
      end
    end
    board_labels.flatten
  end

  def create_spaces_for_array(coordinates)
    spaces = coordinates.map do |coordinates|
      [coordinates, Space.new(coordinates)]
    end
    spaces.to_h
  end

  def create_space_for_coordinate(coordinate)
    coordinate = [coordinate, Space.new(coordinate)]
  end

  def split_board_labels_by_row
    build_board_labels.each_slice(@size).to_a
  end

  def split_board_labels_by_column
    columns = build_board_labels.sort_by do |coordinate|
      coordinate[1]
    end
    sorted_columns = columns.each_slice(@size).to_a.map do |array|
      array.sort
    end
    sorted_columns
  end

  def build_board_hash_with_rows
    split_board_labels_by_row.map do |row|
      [row[0][0], row]
    end.to_h
  end

  # def build_board_hash_with_rows
  #   split_board_labels_by_row.map.with_index do |row, index|
  #     [(index + 1), row]
  #   end.to_h
  # end

  def build_board_hash_with_columns
    split_board_labels_by_column.map.with_index do |column, index|
      [(index + 1), column]
    end.to_h
  end

  def build_final_grid_with_rows_as_keys
    final_board = {}
    build_board_hash_with_rows.each do |row, coordinates|
      final_board[row] = create_spaces_for_array(coordinates)
    end
    final_board
  end

  def build_final_game_board
    final_game_board = {}
    final_board = build_board_labels.map do |coordinate|
      create_space_for_coordinate(coordinate)
    end
    final_board.each do |coordinate|
      final_game_board[coordinate[0]] = coordinate[1]
    end
    final_game_board
  end

end

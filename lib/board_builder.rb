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

  def create_spaces(coordinates)
    spaces = coordinates.map do |coordinates|
      [coordinates, Space.new(coordinates)]
    end
    spaces.to_h
  end

  def split_board_labels_by_row
    board_labels_by_row = build_board_labels.each_slice(@size).to_a
  end

  def build_board_hash_with_rows
    split_board_labels_by_row.map.with_index do |row, index|
      [(index + 1), row]
    end.to_h
  end

  def build_final_grid
    final_board = {}
    build_board_hash_with_rows.each do |row, coordinates|
      final_board[row] = create_spaces(coordinates)
    end
    final_board
  end

end

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

  def create_spaces
    spaces = build_board_labels.map do |coordinates|
      [coordinates, Space.new(coordinates)]
    end
    spaces.to_h
  end

end

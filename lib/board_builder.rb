class Board_builder

  def build_letter_axis(size)
    ("A".."Z").to_a.shift(size)
  end

  def build_number_axis(size)
    ("1".."26").to_a.shift(size)
  end

  def build_board_labels(size)
    build_letter_axis(size).map do |letter|
      build_number_axis(size).map do |number|
        letter + number
      end
    end
  end

  def create_spaces
    
  end

end

board = Board_builder.new
p board.build_board_labels(4)

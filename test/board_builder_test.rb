require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'

class BoardBuilderTest < Minitest::Test

  def test_that_board_gets_letter_axis
    board = Board.new(4)
    board2 = Board.new(8)
    assert_equal ["A", "B", "C", "D"], board.build_letter_axis
    assert_equal ["A", "B", "C", "D", "E", "F", "G", "H"], board2.build_letter_axis
  end

  def test_that_board_gets_number_axis
    board = Board.new(4)
    board2 = Board.new(8)
    assert_equal ["1", "2", "3", "4"], board.build_number_axis
    assert_equal ["1", "2", "3", "4", "5", "6", "7", "8"], board2.build_number_axis
  end

  def test_board_has_list_of_labels
    board = Board.new(4)
    assert_equal ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"], board.build_board_labels
  end

  def test_board_has_spaces
    board = Board.new(4)
    b_keys = board.create_spaces(board.build_board_labels).keys.map do |key|
      key
    end
    assert_equal ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"], b_keys
  end

  def test_board_labels_split_into_rows_of_given_size
    board = Board.new(4)
    assert_equal [["A1", "A2", "A3", "A4"], ["B1", "B2", "B3", "B4"], ["C1", "C2", "C3", "C4"], ["D1", "D2", "D3", "D4"]], board.split_board_labels_by_row
  end

  def test_board_can_be_built_as_hash_with_rows_as_keys
    board = Board.new(4)
    assert_equal ({1 => ["A1", "A2", "A3", "A4"], 2 => ["B1", "B2", "B3", "B4"], 3 => ["C1", "C2", "C3", "C4"], 4 => ["D1", "D2", "D3", "D4"]}), board.build_board_hash_with_rows
  end

  def test_final_board
    board = Board.new(4)
    expected =
    assert_equal expected, board.build_final_board
  end


end

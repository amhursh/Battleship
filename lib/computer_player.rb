class ComputerPlayer < Player

  attr_reader :computer_board,
              :shells_fired,
              :ships

  def initialize(size)
    @computer_board = Board.new(size)
    @shells_fired = 0
    @ships = []
  end

end

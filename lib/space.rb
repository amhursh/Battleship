require './lib/ship'

class Space

  attr_reader :coordinates

  attr_accessor :shelled,
                :occupied,
                :add_ship

  def initialize(coordinates)
    @coordinates = coordinates
    @shelled = false
    @occupied = [false, nil]
  end

  def add_ship(ship)
    @occupied = [true, ship]
  end

end

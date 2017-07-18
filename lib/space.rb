class Space

  attr_reader :coordinates

  attr_accessor :shelled,
                :occupied

  def initialize(coordinates)
    @coordinates = coordinates
    @shelled = false
    @occupied = [false, nil]
  end

end

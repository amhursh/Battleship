class Ship

  attr_accessor :length,
                :health,
                :type,
                :sunk

  def initialize(length)
    @length = length
    @health = set_health
    @sunk = false
    @type = set_type
  end

  def set_type
    if length == 2
      @type = "Destroyer"
    elsif length == 3
      @type = "Cruiser"
    elsif length == 4
      @type = "Battleship"
    elsif length == 5
      @type = "Carrier"
    end
  end

  def set_health
    @health = length
  end

  def sunk?
    if @health == 0
      @sunk = true
    else
      @sunk = false
    end
  end

end

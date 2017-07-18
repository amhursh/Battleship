require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_ship_exists
    ship = Ship.new(2)
    assert_instance_of Ship, ship
  end

  def test_ship_has_length
    ship = Ship.new(2)
    assert_equal 2, ship.length
  end

  def test_ship_has_type
    ship = Ship.new(2)
    assert_equal "Destroyer", ship.type

    ship = Ship.new(3)
    assert_equal "Cruiser", ship.type

    ship = Ship.new(4)
    assert_equal "Battleship", ship.type

    ship = Ship.new(5)
    assert_equal "Carrier", ship.type
  end

  def test_ship_has_health
    ship = Ship.new(2)
    assert_equal 2, ship.health
  end

  def test_ship_is_not_sunk
    ship = Ship.new(2)
    refute ship.sunk?
  end

  def test_ship_is_sunk
    ship = Ship.new(2)
    ship.health = 0
    assert ship.sunk?
  end

end

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/space'
require './lib/ship'

class SpaceTest < Minitest::Test

  def test_space_exists
    space = Space.new("A1")
    assert_instance_of Space, space
  end

  def test_space_has_coordinates
    space = Space.new("A1")

    assert_equal "A1", space.coordinates
  end

  def test_space_is_not_shelled_by_default
    space = Space.new("A1")

    refute space.shelled
  end

  def test_space_is_not_occupied_by_default
    space = Space.new("A1")

    assert_equal [false, nil], space.occupied
  end

  def test_space_can_get_ship
    space = Space.new("A1")
    space.add_ship(Ship.new(2))

    assert_equal true, space.occupied[0]
    assert_instance_of Ship, space.occupied[1]
  end

end

require 'test_helper'
require './app/models/landscape/position'
require './app/models/landscape/planet'

class PlanetTest < ActiveSupport::TestCase
  test "position is inside landscape" do
    planet = Planet.new(5, 5)
    position = Position.new(1, 2)

    assert_equal true, planet.is_valid_position(position)
  end

  test "position XAxis Outside Landscape From Right" do
    planet = Planet.new(5, 5)
    position = Position.new(6, 2)

    assert_equal false, planet.is_valid_position(position)
  end

  test "position XAxis Outside Landscape From Left" do
    planet = Planet.new(5, 5)
    position = Position.new(-1, 2)

    assert_equal false, planet.is_valid_position(position)
  end

  test "position YAxis Outside Landscape From Right" do
    planet = Planet.new(5, 5)
    position = Position.new(2, 6)

    assert_equal false, planet.is_valid_position(position)
  end

  test "position YAxis Outside Landscape From Left" do
    planet = Planet.new(5, 5)
    position = Position.new(2, -1)

    assert_equal false, planet.is_valid_position(position)
  end


end

require 'test_helper'
require './app/models/landscape/planet'
require './app/models/landscape/position'
require './app/models/vehicle/rover'
require_all './app/models/orientation'

class RoverTest < ActiveSupport::TestCase

  planet = Planet.new(5, 5)

  test "location printing OK" do

    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationNorth.new)
    assert_equal '2 3 N', rover.location
  end

  test "move to Nord" do
    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationNorth.new)
    rover.move
    assert_equal '2 4 N', rover.location
  end

  test "move to South" do
    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationSouth.new)
    rover.move
    assert_equal '2 2 S', rover.location
  end

  test "move to East" do
    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationEast.new)
    rover.move
    assert_equal '3 3 E', rover.location
  end

  test "move to West" do
    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationWest.new)
    rover.move
    assert_equal '1 3 W', rover.location
  end

  test "move outside north" do
    position = Position.new(2, 5)
    rover = Rover.new(planet, position, OrientationNorth.new)
    assert_equal 'Position 2 6 N is outside plateau limits', rover.move
  end

  test "move outside east" do
    position = Position.new(5, 3)
    rover = Rover.new(planet, position, OrientationEast.new)
    assert_equal 'Position 6 3 E is outside plateau limits', rover.move
  end

  test "turn left from North" do
    position = Position.new(1, 3)
    rover = Rover.new(planet, position, OrientationNorth.new)
    rover.turn_left
    assert_equal '1 3 W', rover.location
  end

  test "turn left from South" do
    position = Position.new(1, 3)
    rover = Rover.new(planet, position, OrientationSouth.new)
    rover.turn_left
    assert_equal '1 3 E', rover.location
  end

 test "turn right from North" do
    position = Position.new(1, 3)
    rover = Rover.new(planet, position, OrientationNorth.new)
    rover.turn_right
    assert_equal '1 3 E', rover.location
  end

  test "turn right from South" do
    position = Position.new(1, 3)
    rover = Rover.new(planet, position, OrientationSouth.new)
    rover.turn_right
    assert_equal '1 3 W', rover.location
  end



end

require 'test_helper'
require_all './app/models/landscape'
require_all './app/helpers/command'
require_relative '../../../app/models/vehicle/rover'

class TurnLeftCommandTest < ActiveSupport::TestCase

  planet = Planet.new(5, 5)

  test "turn left from north" do

    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationNorth.new)

    turn_left_command = TurnLeftCommand.new
    turn_left_command.execute(rover)

    assert_equal '2 3 W', rover.location
  end

  test "turn left from south" do

    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationSouth.new)

    turn_left_command = TurnLeftCommand.new
    turn_left_command.execute(rover)

    assert_equal '2 3 E', rover.location

  end

  test "turn left from east" do

    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationEast.new)

    turn_left_command = TurnLeftCommand.new
    turn_left_command.execute(rover)

    assert_equal '2 3 N', rover.location
  end

  test "turn left from west" do

    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationWest.new)

    turn_left_command = TurnLeftCommand.new
    turn_left_command.execute(rover)

    assert_equal '2 3 S', rover.location
  end

end

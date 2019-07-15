require 'test_helper'
require_all './app/models/landscape'
require_all './app/helpers/command'
require_relative '../../../app/models/vehicle/rover'

class TurnRightCommandTest < ActiveSupport::TestCase

  planet = Planet.new(5, 5)

  test "turn right from north" do

    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationNorth.new)

    turn_right_command = TurnRightCommand.new
    turn_right_command.execute(rover)

    assert_equal '2 3 E', rover.location
  end

  test "turn right from south" do

    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationSouth.new)

    turn_right_command = TurnRightCommand.new
    turn_right_command.execute(rover)

    assert_equal '2 3 W', rover.location
  end

  test "turn right from east" do

    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationEast.new)

    turn_right_command = TurnRightCommand.new
    turn_right_command.execute(rover)

    assert_equal '2 3 S', rover.location
  end

  test "turn right from west" do

    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationWest.new)

    turn_right_command = TurnRightCommand.new
    turn_right_command.execute(rover)

    assert_equal '2 3 N', rover.location
  end

end

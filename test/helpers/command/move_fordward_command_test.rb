require 'test_helper'
require_all './app/models/landscape'
require_all './app/helpers/command'
require_relative '../../../app/models/vehicle/rover'

class MoveForwardCommandTest < ActiveSupport::TestCase

  planet = Planet.new(5, 5)

  test "move forward from north" do

    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationNorth.new)

    move_forward_command = MoveForwardCommand.new
    move_forward_command.execute(rover)

    assert_equal '2 4 N', rover.location
  end

  test "move forward from south" do

    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationSouth.new)

    move_forward_command = MoveForwardCommand.new
    move_forward_command.execute(rover)

    assert_equal '2 2 S', rover.location
  end

  test "move forward from east" do

    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationEast.new)

    move_forward_command = MoveForwardCommand.new
    move_forward_command.execute(rover)

    assert_equal '3 3 E', rover.location
  end

  test "move forward from west" do

    position = Position.new(2, 3)
    rover = Rover.new(planet, position, OrientationWest.new)

    move_forward_command = MoveForwardCommand.new
    move_forward_command.execute(rover)

    assert_equal '1 3 W', rover.location
  end

end

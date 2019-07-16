require 'test_helper'
require_all './app/models/landscape'
require_all './app/helpers/command'
require_all './app/models/vehicle'
require_relative '../../app/helpers/application_helper'

class ApplicationHelperTest < ActiveSupport::TestCase

  planet = Planet.new(5, 5)

  test "input has correct number of lines" do
    input_commands = "5 5\n1 2 N\nMM"
    assert_equal true, ApplicationHelper.validate_input_data_lines(input_commands)
  end

  test "input has incorrect number of lines" do
    input_commands = "5 5\n1 2 N"
    assert_equal false, ApplicationHelper.validate_input_data_lines(input_commands)
  end

  test "rover commands are correct" do
    input_commands = "LRM"
    assert_equal true, ApplicationHelper.validate_rover_movements(input_commands)
  end

  test "rover input commands black are controlled" do
    input_commands = ""
    assert_equal false, ApplicationHelper.validate_rover_movements(input_commands)
    assert_equal false, ApplicationHelper.validate_rover_movements(nil)
  end

  test "rover commands are incorrect" do
    input_commands = "INVALID"
    assert_equal false, ApplicationHelper.validate_rover_movements(input_commands)
  end

  # TRANSLATOR TESTS
  test "build planet" do
    input_data = "2 5"
    planet = ApplicationHelper.build_planet(input_data)
    assert_equal false, planet.nil?
    assert_equal true, planet.x_axis_dimension == 2
    assert_equal true, planet.y_axis_dimension == 5
  end

  test "build rover" do
    input_data = "1 2 N"
    rover = ApplicationHelper.build_rover(planet, input_data)
    assert_equal false, rover.nil?
    assert_equal "1 2 N", rover.location
  end

  test "build rover outside planet controlled" do
    input_data = "1 6 N"
    rover = ApplicationHelper.build_rover(planet, input_data)
    assert_equal false, rover
  end

  # COMMANDS TEST
  test "read commands ok" do
    input_data = "LMRM"
    command_list = ApplicationHelper.build_command_list(input_data)
    assert_equal true, command_list.is_a?(Array)
    assert_equal 4, command_list.length
  end

  test "read commands sorted" do
    input_data = "LMRM"
    command_list = ApplicationHelper.build_command_list(input_data)
    assert_equal true, command_list.is_a?(Array)
    assert_equal true, command_list[0].is_a?(TurnLeftCommand)
    assert_equal true, command_list[1].is_a?(MoveForwardCommand)
    assert_equal true, command_list[2].is_a?(TurnRightCommand)
    assert_equal true, command_list[3].is_a?(MoveForwardCommand)
  end

  test "read empty commands controlled" do
    input_data = ""
    command_list = ApplicationHelper.build_command_list(input_data)
    assert_equal false, command_list
  end

  test "read invalid commands controlled" do
    input_data = "INVALID"
    command_list = ApplicationHelper.build_command_list(input_data)
    assert_equal false, command_list
  end

end

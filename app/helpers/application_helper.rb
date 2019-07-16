require_all './app/helpers/command'

module ApplicationHelper

  REGISTERED_COMMANDS = {MoveForwardCommand.new => "M", TurnLeftCommand.new => "L", TurnRightCommand.new => "R"}

  def self.validate_input_data_lines(input_commands)
    !input_commands.strip.empty? && input_commands.lines.count % 2 == 1
  end

  def self.validate_rover_movements(input_commands)

    unless input_commands.nil? || input_commands.strip.empty?
      input_commands.chars.each do |movement|
        return false if REGISTERED_COMMANDS.key(movement).nil?
      end
      return true
    end
    return false
  end

  def self.build_planet(input_data)
    intDimensions = input_data.split(" ").map { |dimension| dimension.to_i }
    Planet.new(intDimensions[0], intDimensions[1])
  end

  def self.build_rover(planet, input_data)
    rover_init_position = input_data.split(" ")
    position = Position.new(rover_init_position[0].to_i, rover_init_position[1].to_i)
    return false unless planet.is_valid_position(position)
    Rover.new(planet, position, create_orientation(rover_init_position[2]))
  end

  def self.build_command_list(input_data)
    return false unless validate_rover_movements(input_data)
    command_list = Array.new
    input_data.chars.each do |command|
      command_list.push(REGISTERED_COMMANDS.key(command))
    end
    return command_list
  end

  private

  def self.create_orientation(orientation)
    case orientation
      when "N" then OrientationNorth.new
      when "S" then OrientationSouth.new
      when "E" then OrientationEast.new
      else OrientationWest.new
    end
  end

end

require './app/helpers/api/v1/marsrovers_helper'

class Api::V1::MarsroversController < ApplicationController
  def index
    input_data = params[:inputdata]
    arr_input_data = input_data.each_line.to_a

    planet = Api::V1::MarsroversHelper.build_planet(arr_input_data[0])
    rovers_and_instructions = arr_input_data.slice(1, arr_input_data.length)

    final_positions = Array.new
    rover = nil
    rovers_and_instructions.each_index do |index|
       if index % 2 == 0
         #Rover initial position
         rover = Api::V1::MarsroversHelper.build_rover(planet, rovers_and_instructions[index].strip)
       else
         #Odd lines are rover commands
         command_list = Api::V1::MarsroversHelper.build_command_list(rovers_and_instructions[index].strip)
         final_positions.push(run_commands(command_list, rover))
       end
    end
    render json: {final_positions: final_positions},status: :ok
  end

  private

  def run_commands(command_list, rover)
    command_list.each { |command| command.execute(rover) }
    rover.location
  end
end

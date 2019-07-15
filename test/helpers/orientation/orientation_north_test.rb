require 'test_helper'
require './app/models/landscape/planet'
require_all './app/helpers/orientation'

class OrientationNorthTest < ActiveSupport::TestCase
  test "turn left" do
    orientation = OrientationNorth.new
    assert_equal true, orientation.turn_left.instance_of?(OrientationWest)
  end
end

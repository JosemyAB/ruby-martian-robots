require 'test_helper'
require './app/models/landscape/planet'
require_all './app/helpers/orientation'

class OrientationSouthTest < ActiveSupport::TestCase
  test "turn left" do
    orientation = OrientationSouth.new
    assert_equal true, orientation.turn_left.instance_of?(OrientationEast)
  end
end

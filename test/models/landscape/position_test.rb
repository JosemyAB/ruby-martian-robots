require 'test_helper'
require './app/models/landscape/position'

class PositionTest < ActiveSupport::TestCase
  test "position printing" do
    position = Position.new(3, 2)
    assert_equal '3 2', position.location
  end
end

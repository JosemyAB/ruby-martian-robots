
class Position
  def initialize(xAxis, yAxis)
    @xAxis = xAxis
    @yAxis = yAxis
  end

  attr_reader :xAxis, :yAxis

  def location
    "#{xAxis} #{yAxis}"
  end

end

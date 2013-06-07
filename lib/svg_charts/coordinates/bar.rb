class BarCoordinates
  def initialize(data, width, height, y_retreat, x_retreat)
    @data = data

    @width = width
    @height = height

    @y_retreat = y_retreat
    @x_retreat = x_retreat
  end

  def build
    coordinates = []

    @data.each_with_index do |value, i|
      x1 = @x_retreat + (positions[:x] * i)
      y1 = @height - (positions[:y] * value)

      unless @data[i + 1].nil?
        x2 = @x_retreat + (positions[:x] * (i + 1))
      else
        x2 = @width - @x_retreat
      end

      coordinates << [x1.abs, x2.abs, y1.abs]
    end

    coordinates
  end

  private
  def positions
    y = (@height - @y_retreat)/@data.max
    x = (@width - (@x_retreat * 2))/@data.size

    {
      :x => x,
      :y => y
    }
  end
end

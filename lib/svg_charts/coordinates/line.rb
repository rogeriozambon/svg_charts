class LineCoordinates
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
      x2 = x1 = @x_retreat + (positions[:x] * i)
      y2 = y1 = @height - (positions[:y] * value)

      unless @data[i + 1].nil?
        x2 = @x_retreat + (positions[:x] * (i + 1))
        y2 = @height - (positions[:y] * @data[i + 1])
      end

      coordinates << [x1.abs, x2.abs, y1.abs, y2.abs]
    end

    coordinates
  end

  private
  def positions
    y = (@height - @y_retreat)/@data.max
    x = @width - (@x_retreat * 2)

    if @data.size == 1
      x = x/@data.size
    else
      x = x/@data.size.pred
    end

    {
      :x => x,
      :y => y
    }
  end
end

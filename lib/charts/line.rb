module SVGCharts
  class Line
    include SVGElements

    def initialize(options = {})
      raise ArgumentError if options.empty?

      [:width, :height, :y_retreat, :y_label, :x_retreat, :x_label, :x_scale, :data, :data_color].each do |key|
        raise ArgumentError unless options.has_key?(key)
      end

      @width = options[:width]
      @height = options[:height]

      @y_retreat = options[:y_retreat]
      @y_label = options[:y_label]

      @x_retreat = options[:x_retreat]
      @x_label = options[:x_label]
      @x_scale = options[:x_scale]

      @data = options[:data]
      @data_color = options[:data_color]
    end

    def draw_scale
      scales = ""

      scales << line({
        :x1 => @x_retreat - 8,
        :x2 => @x_retreat - 8,
        :y1 => @y_retreat - 2,
        :y2 => @height + 13,
        :line_width => 2,
        :color => "#aaa"
      })

      scales << line({
        :x1 => 0,
        :x2 => @width,
        :y1 => @height,
        :y2 => @height,
        :line_width => 2,
        :color => "#aaa"
      })

      scales << text({
        :x => @width/2 - (@y_label.length * 2),
        :y => @height + 30,
        :color => "#bbb",
        :font_size => 11,
        :font_weight => "bold",
        :value => @x_label
      })

      scales << text_with_rotation({
        :x => @height/2 - (@y_label.length * 2),
        :y => 8,
        :color => "#bbb",
        :font_size => 11,
        :font_weight => "bold",
        :rotate => "270 #{@height/2} #{@height/2}",
        :value => @y_label
      })

      scales
    end

    def draw_chart
      calculate_coordinates

      elements = ""

      @coordinates.each_with_index do |coordinate, i|
        elements << line({
          :x1 => coordinate[0],
          :x2 => coordinate[1],
          :y1 => coordinate[2],
          :y2 => coordinate[3],
          :line_width => 1,
          :color => "#999"
        })

        elements << line_dashed({
          :x1 => coordinate[0],
          :x2 => coordinate[0],
          :y1 => @height,
          :y2 => coordinate[2],
          :line_width => 1,
          :color => "#b9b9b9"
        })

        elements << circle({
          :x => coordinate[0],
          :y => coordinate[2],
          :radius => 2,
          :background => "#fff",
          :line_width => 2,
          :line_color => "#444"
        })

        elements << text({
          :x => coordinate[0] - 10,
          :y => coordinate[2] - 10,
          :color => @data_color,
          :font_size => 11,
          :font_weight => "bold",
          :value => @data[i]
        })

        elements << text({
          :x => coordinate[0] - 5,
          :y => @height + 12,
          :color => "#999",
          :font_size => 10,
          :font_weight => "normal",
          :value => @x_scale[i]
        })
      end

      elements
    end

    private
    def calculate_coordinates
      @coordinates = []

      y_positions = (@height - @y_retreat)/@data.max
      x_positions = @width/@data.size

      @data.each_with_index do |value, i|
        x1 = @x_retreat + (x_positions * i)
        y1 = @height - (y_positions * value)

        unless @data[i + 1].nil?
          x2 = @x_retreat + (x_positions * (i + 1))
          y2 = @height - (y_positions * @data[i + 1])
        else
          x2 = x1
          y2 = y1
        end

        @coordinates << [x1.abs, x2.abs, y1.abs, y2.abs]
      end
    end
  end
end

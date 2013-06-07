module SVGCharts
  class Line < ChartScale
    include SVGElements

    def initialize(options)
      validation options, [:width, :height, :y_retreat, :x_retreat]

      @width = options[:width]
      @height = options[:height]

      @y_retreat = options[:y_retreat]
      @x_retreat = options[:x_retreat]
    end

    def scale(options)
      validation options, [:y_label, :x_label]

      %{
        #{create_line_to_scale_y_axis},
        #{create_line_to_scale_x_axis},
        #{create_text_to_scale_y_axis(options[:y_label], options[:x_label])},
        #{create_text_to_scale_x_axis(options[:y_label], options[:x_label])}
      }
    end

    def draw(options)
      validation options, [:scale, :data, :data_color, :show_scale, :show_dashed]

      coordinates = LineCoordinates.new options[:data], @width, @height, @y_retreat, @x_retreat

      elements = ""

      coordinates.build.each_with_index do |coordinate, i|
        @coordinate = coordinate

        elements << create_line_to_draw(options[:data_color])
        elements << create_dashed_line_to_draw if options[:show_dashed]
        elements << create_circle_to_draw
        elements << create_text_to_draw(options[:data_color], options[:data][i])
        elements << create_scale_text_to_draw(options[:scale][i]) if options[:show_scale]
      end

      elements
    end

    private
    def create_line_to_draw(color)
      line({
        :x1 => @coordinate[0],
        :x2 => @coordinate[1],
        :y1 => @coordinate[2],
        :y2 => @coordinate[3],
        :line_width => 1,
        :color => color
      })
    end

    def create_dashed_line_to_draw
      line_dashed({
        :x1 => @coordinate[0],
        :x2 => @coordinate[0],
        :y1 => @height,
        :y2 => @coordinate[2],
        :line_width => 1,
        :color => "#b9b9b9"
      })
    end

    def create_circle_to_draw
      circle({
        :x => @coordinate[0],
        :y => @coordinate[2],
        :radius => 2,
        :background => "#fff",
        :line_width => 2,
        :line_color => "#444"
      })
    end

    def create_text_to_draw(color, text)
      text({
        :x => @coordinate[0] - 10,
        :y => @coordinate[2] - 10,
        :color => color,
        :font_size => 11,
        :font_weight => "bold",
        :value => text
      })
    end

    def create_scale_text_to_draw(text)
      text({
        :x => @coordinate[0] - 5,
        :y => @height + 12,
        :color => "#999",
        :font_size => 10,
        :font_weight => "normal",
        :value => text
      })
    end

    def validation(options, params)
      raise ArgumentError if options.empty?

      params.each do |key|
        raise ArgumentError unless options.has_key?(key)
      end
    end
  end
end

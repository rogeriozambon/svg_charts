module SVGCharts
  class Bar < ChartScale
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
      validation options, [:scale, :data, :data_color, :show_scale]

      coordinates = BarCoordinates.new options[:data], @width, @height, @y_retreat, @x_retreat

      elements = ""

      coordinates.build.each_with_index do |coordinate, i|
        @coordinate = coordinate

        elements << create_rect_to_draw(options[:data_color])
        elements << create_text_to_draw(options[:scale][i], options[:data_color], options[:data][i])
        elements << create_scale_text_to_draw(options[:scale][i]) if options[:show_scale]
      end

      elements
    end

    private
    def create_rect_to_draw(color)
      rect({
        :x => @coordinate[0] * 1.025,
        :y => @coordinate[2],
        :width => @coordinate[1] - @coordinate[0],
        :height => @height - @coordinate[2],
        :color => color
      })
    end

    def create_text_to_draw(scale, color, text)
      text({
        :x => (((@coordinate[1] - @coordinate[0]) - scale.length)/2) + (@coordinate[0] * 1.025) - 10,
        :y => @coordinate[2] - 10,
        :color => color,
        :font_size => 11,
        :font_weight => "bold",
        :value => text
      })
    end

    def create_scale_text_to_draw(scale)
      text({
        :x => (((@coordinate[1] - @coordinate[0]) - scale.length)/2) + (@coordinate[0] * 1.025) - 10,
        :y => @height + 12,
        :color => "#999",
        :font_size => 10,
        :font_weight => "normal",
        :value => scale
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

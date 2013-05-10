module SVGCharts
  class Line
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

      scale = line({
        :x1 => @x_retreat - 8,
        :x2 => @x_retreat - 8,
        :y1 => @y_retreat - 2,
        :y2 => @height + 13,
        :line_width => 2,
        :color => "#aaa"
      })

      scale << line({
        :x1 => 0,
        :x2 => @width,
        :y1 => @height,
        :y2 => @height,
        :line_width => 2,
        :color => "#aaa"
      })

      scale << text({
        :x => @width/2 - (options[:y_label].length * 2),
        :y => @height + 30,
        :color => "#bbb",
        :font_size => 11,
        :font_weight => "bold",
        :value => options[:x_label]
      })

      scale << text_with_rotation({
        :x => @height/2 - (options[:y_label].length * 2),
        :y => 8,
        :color => "#bbb",
        :font_size => 11,
        :font_weight => "bold",
        :rotate => "270 #{@height/2} #{@height/2}",
        :value => options[:y_label]
      })

      scale
    end

    def draw(options)
      validation options, [:scale, :data, :data_color, :show_scale, :show_dashed]

      calculate_coordinates options[:data]

      elements = ""

      @coordinates.each_with_index do |coordinate, i|
        elements << line({
          :x1 => coordinate[0],
          :x2 => coordinate[1],
          :y1 => coordinate[2],
          :y2 => coordinate[3],
          :line_width => 1,
          :color => options[:data_color]
        })

        if options[:show_dashed]
          elements << line_dashed({
            :x1 => coordinate[0],
            :x2 => coordinate[0],
            :y1 => @height,
            :y2 => coordinate[2],
            :line_width => 1,
            :color => "#b9b9b9"
          })
        end

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
          :color => options[:data_color],
          :font_size => 11,
          :font_weight => "bold",
          :value => options[:data][i]
        })

        if options[:show_scale]
          elements << text({
            :x => coordinate[0] - 5,
            :y => @height + 12,
            :color => "#999",
            :font_size => 10,
            :font_weight => "normal",
            :value => options[:scale][i]
          })
        end
      end

      elements
    end

    private
    def calculate_coordinates(data)
      @coordinates = []

      y_positions = (@height - @y_retreat)/data.max
      x_positions = @width - (@x_retreat * 2)

      if data.size == 1
        x_positions = x_positions/data.size
      else
        x_positions = x_positions/(data.size - 1)
      end

      data.each_with_index do |value, i|
        x1 = @x_retreat + (x_positions * i)
        y1 = @height - (y_positions * value)

        unless data[i + 1].nil?
          x2 = @x_retreat + (x_positions * (i + 1))
          y2 = @height - (y_positions * data[i + 1])
        else
          x2 = x1
          y2 = y1
        end

        @coordinates << [x1.abs, x2.abs, y1.abs, y2.abs]
      end
    end

    def validation(options, params)
      raise ArgumentError if options.empty?

      params.each do |key|
        raise ArgumentError unless options.has_key?(key)
      end
    end
  end
end

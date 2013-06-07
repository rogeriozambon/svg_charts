class ChartScale
  def create_line_to_scale_y_axis
    line({
      :x1 => @x_retreat - 8,
      :x2 => @x_retreat - 8,
      :y1 => @y_retreat - 2,
      :y2 => @height + 13,
      :line_width => 2,
      :color => "#aaa"
    })
  end

  def create_line_to_scale_x_axis
    line({
      :x1 => 0,
      :x2 => @width,
      :y1 => @height,
      :y2 => @height,
      :line_width => 2,
      :color => "#aaa"
    })
  end

  def create_text_to_scale_y_axis(y_label, x_label)
    text({
      :x => @width/2 - (y_label.length * 2),
      :y => @height + 30,
      :color => "#bbb",
      :font_size => 11,
      :font_weight => "bold",
      :value => x_label
    })
  end

  def create_text_to_scale_x_axis(y_label, x_label)
    text_with_rotation({
      :x => @height/2 - (y_label.length * 2),
      :y => 8,
      :color => "#bbb",
      :font_size => 11,
      :font_weight => "bold",
      :rotate => "270 #{@height/2} #{@height/2}",
      :value => y_label
    })
  end
end

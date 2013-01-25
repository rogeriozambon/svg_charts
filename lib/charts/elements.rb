module SVGElements
  def line(params = {})
    "<line x1=\"#{params[:x1]}\" y1=\"#{params[:y1]}\" x2=\"#{params[:x2]}\" y2=\"#{params[:y2]}\" stroke-width=\"#{params[:line_width]}\" stroke=\"#{params[:color]}\" />"
  end

  def line_dashed(params = {})
    "<line x1=\"#{params[:x1]}\" y1=\"#{params[:y1]}\" x2=\"#{params[:x2]}\" y2=\"#{params[:y2]}\" stroke-width=\"#{params[:line_width]}\" stroke=\"#{params[:color]}\" stroke-dasharray=\"5,5\" />"
  end

  def circle(params = {})
    "<circle cx=\"#{params[:x]}\" cy=\"#{params[:y]}\" r=\"#{params[:radius]}\" stroke=\"#{params[:line_color]}\" stroke-width=\"#{params[:line_width]}\" fill=\"#{params[:background]}\" />"
  end

  def rect(params = {})
    "<rect x=\"#{params[:x]}\" y=\"#{params[:y]}\" width=\"#{params[:width]}\" height=\"#{params[:height]}\" fill=\"#{params[:color]}\" />"
  end

  def text(params = {})
    "<text x=\"#{params[:x]}\" y=\"#{params[:y]}\" fill=\"#{params[:color]}\" font-size=\"#{params[:font_size]}\" font-weight=\"#{params[:font_weight]}\">#{params[:value]}</text>"
  end

  def text_with_rotation(params = {})
    "<text x=\"#{params[:x]}\" y=\"#{params[:y]}\" fill=\"#{params[:color]}\" font-size=\"#{params[:font_size]}\" font-weight=\"#{params[:font_weight]}\" transform=\"rotate(#{params[:rotate]})\">#{params[:value]}</text>"
  end
end

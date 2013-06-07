# SVGCharts

[![Gem Version](https://badge.fury.io/rb/svg_charts.png)](http://badge.fury.io/rb/svg_charts)
[![Build Status](https://travis-ci.org/rogeriozambon/anp_prices.png?branch=master)](https://travis-ci.org/rogeriozambon/anp_prices)
[![Code Climate](https://codeclimate.com/github/rogeriozambon/svg_charts.png)](https://codeclimate.com/github/rogeriozambon/svg_charts)

Draw charts using SVG.

## Installation

  gem install svg_charts

## Usage

~~~.ruby
#=> file.rb

require "rubygems"
require "svg_charts"

line = SVGCharts::Line.new({
  :height => 300,
  :width => 300,
  :y_retreat => 20,
  :x_retreat => 20
})

@scale = line.scale({
  :y_label => "Numbers",
  :x_label => "Letters"
})

@chart = line.draw({
  :scale => ["A", "B", "C"],
  :data => [10, 20, 30],
  :data_color => "#000000",
  :show_scale => true,
  :show_dashed => true
})
~~~

	# file.erb

	<svg width="680" height="350">
		<%= @scale %>
		<%= @chart %>
	</svg>

## Maintainer

* Rogério Zambon (http://rogerio.me)

## Collaborators

* André Ronix (http://www.linkedin.com/pub/andr%C3%A9-s-ronix/27/212/3b2): Generated the coordinates calc.

## License

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

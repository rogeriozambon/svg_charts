require "spec_helper"

describe SVGCharts::Line do
  context "missing parameters" do
    it "when hash empty" do
      expect { chart = SVGCharts::Line.new }.to raise_error(ArgumentError)
    end

    it "when the hash keys is incomplete" do
      options = {
        :width => 300,
        :height => 300
      }

      expect { chart = SVGCharts::Line.new options }.to raise_error(ArgumentError)
    end
  end

  context "when generated" do
    before do
      @options = {
        :height => 320,
        :width => 680,
        :y_retreat => 20,
        :y_label => "Numbers",
        :x_retreat => 20,
        :x_label => "Letters",
        :x_scale => ["A", "B", "C"],
        :data => [10, 20, 30],
        :data_color => "#000000"
      }
    end

    it "check chart values" do
      line_chart = SVGCharts::Line.new(@options).draw_chart

      values = line_chart.gsub( /<[^>]*>/, " ").split
      values.should include("10")
      values.should include("20")
      values.should include("30")
      values.should include("A")
      values.should include("B")
      values.should include("C")
    end

    it "check scale values" do
      line_chart = SVGCharts::Line.new(@options).draw_scale

      values = line_chart.gsub( /<[^>]*>/, " ").split
      values.should include("Letters")
      values.should include("Numbers")
    end

    def count_words(expression, target)
      counter = 0

      expression.split.each do |word|
        counter += 1 if word.include? target
      end

      counter
    end

    it "check chart elements" do
      line_chart = SVGCharts::Line.new(@options).draw_chart

      count_words(line_chart, "<line").should == 6
      count_words(line_chart, "<text").should == 6
      count_words(line_chart, "<circle").should == 3
    end

    it "check scale elements" do
      line_chart = SVGCharts::Line.new(@options).draw_scale

      count_words(line_chart, "<line").should == 2
      count_words(line_chart, "<text").should == 2
    end
  end
end

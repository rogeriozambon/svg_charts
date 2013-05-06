require "spec_helper"

describe SVGCharts::Bar do
  context "initialize object" do
    context "missing parameters" do
      it "when hash empty" do
        expect { chart = SVGCharts::Bar.new }.to raise_error(ArgumentError)
      end

      it "when the hash keys is incomplete" do
        options = {
          :width => 300,
          :height => 300
        }

        expect { chart = SVGCharts::Bar.new options }.to raise_error(ArgumentError)
      end
    end
  end

  def count_words(expression, target)
    counter = 0

    expression.split.each do |word|
      counter += 1 if word.include? target
    end

    counter
  end

  context "set scale" do
    before do
      @svg_chart = SVGCharts::Bar.new({
        :height => 300,
        :width => 300,
        :y_retreat => 20,
        :x_retreat => 20
      })
    end

    context "missing parameters" do
      it "when hash empty" do
        expect { chart = @svg_chart.scale }.to raise_error(ArgumentError)
      end

      it "when the hash keys is incomplete" do
        options = {
          :y_label => "First label"
        }

        expect { chart = @svg_chart.scale options }.to raise_error(ArgumentError)
      end
    end

    context "when generated" do
      it "check values" do
        scale = @svg_chart.scale({
          :y_label => "Label1",
          :x_label => "Label2"
        })

        scale = scale.gsub( /<[^>]*>/, " ").split
        scale.should include("Label1")
        scale.should include("Label2")
      end

      it "check elements" do
        scale = @svg_chart.scale({
          :y_label => "Label1",
          :x_label => "Label2"
        })

        count_words(scale, "<line").should == 2
        count_words(scale, "<text").should == 2
      end
    end
  end

  context "set chart" do
    before do
      @svg_chart = SVGCharts::Bar.new({
        :height => 300,
        :width => 300,
        :y_retreat => 20,
        :x_retreat => 20
      })
    end

    context "missing parameters" do
      it "when hash empty" do
        expect { chart = @svg_chart.draw }.to raise_error(ArgumentError)
      end

      it "when the hash keys is incomplete" do
        options = {
          :data_color => "#000000",
          :show_scale => false
        }

        expect { chart = @svg_chart.draw options }.to raise_error(ArgumentError)
      end
    end

    context "when generated" do
      it "check elements with no scale and dashed" do
        chart = @svg_chart.draw({
          :scale => ["A", "B", "C"],
          :data => [10, 20, 30],
          :data_color => "#000000",
          :show_scale => false
        })

        count_words(chart, "<rect").should == 3
        count_words(chart, "<text").should == 3
      end

      it "check elements with scale and dashed" do
        chart = @svg_chart.draw({
          :scale => ["A", "B", "C"],
          :data => [10, 20, 30],
          :data_color => "#000000",
          :show_scale => true
        })

        count_words(chart, "<rect").should == 3
        count_words(chart, "<text").should == 6
      end
    end
  end
end

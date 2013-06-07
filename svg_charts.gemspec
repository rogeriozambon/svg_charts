# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "svg_charts/version"

Gem::Specification.new do |s|
  s.name        = "svg_charts"
  s.version     = SVGCharts::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Rogério Zambon"]
  s.email       = ["rogeriozambon@gmail.com"]
  s.homepage    = "http://github.com/rogeriozambon/svg_charts"
  s.summary     = "Draw charts using SVG."
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end

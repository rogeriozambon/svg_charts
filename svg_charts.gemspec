# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.authors = ["Rogério Zambon"]
  s.date = "2013-01-28"
  s.description = "Draw charts using SVG."
  s.email = "rogeriozambon@gmail.com"
  s.files = [
    ".rspec",
    "lib/charts/elements.rb",
    "lib/charts/line.rb",
    "lib/svg_charts.rb",
    "spec/spec_helper.rb",
    "spec/charts/line_spec.rb",
    "VERSION",
    "README.rdoc",
    "svg_charts.gemspec"
  ]
  s.homepage = "http://github.com/rogeriozambon/svg_charts"
  s.name = "svg_charts"
  s.require_paths = ["lib"]
  s.required_rubygems_version = Gem::Requirement.new(">= 1.8.23")
  s.summary = s.description
  s.version = "1.02"
end

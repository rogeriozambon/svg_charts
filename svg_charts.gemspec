# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = "svg_charts"
  s.authors = ["Rogério Zambon"]
  s.email = ["rogeriozambon@gmail.com"]
  s.date = "2013-01-28"
  s.description = "Draw charts using SVG."
  s.homepage = "http://github.com/rogeriozambon/svg_charts"

  s.files = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.required_rubygems_version = Gem::Requirement.new(">= 1.8.23")
  s.summary = s.description

  s.version = "1.02"
end

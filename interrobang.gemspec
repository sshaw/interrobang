# coding: utf-8
require "date"

Gem::Specification.new do |s|
  s.name        = "interrobang"
  s.version     = "0.0.1"
  s.date        = Date.today
  s.summary     = %q{Can't remember if the method ended with "?" or "!"‽ Interrobang solves this by giving you the best of both worlds.}
  s.authors     = ["Skye Shaw"]
  s.email       = "skye.shaw@gmail.com"
  s.test_files  = Dir["test/**/*.*"]
  s.files       = Dir["lib/**/*.rb"] + s.test_files
  s.homepage    = "http://github.com/sshaw/interrobang"
  s.license     = "MIT"
  s.add_development_dependency "rake"
  s.add_development_dependency "minitest", "~> 5.0"
end

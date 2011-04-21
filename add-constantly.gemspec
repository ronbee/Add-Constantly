# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "add-constantly/version"

Gem::Specification.new do |s|
  s.name        = "add-constantly"
  s.version     = Addc::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["ronbee"]
  s.email       = ["ronbee.github@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Lightweight, efficient, and cool online clustering algorithm}
  s.description = %q{Implementation of the Add-Constantly online clustering algorithm. See, --An On-Line Agglomerative Clustering Method for Nonstationary Data-- by Guedalia et al.}

  s.rubyforge_project = "add-constantly"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "split/analytics/version"

Gem::Specification.new do |gem|
  gem.authors       = ["Andrew Nesbitt"]
  gem.email         = ["andrewnez@gmail.com"]
  gem.summary       = %q{Split extension to push test data to google analytics}
  gem.homepage      = "https://github.com/andrew/split-analytics"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "split-analytics"
  gem.require_paths = ['lib']
  gem.version       = Split::Analytics::VERSION

  gem.add_dependency(%q<split>, ["~>  0.3"])

  # Development Dependencies
  gem.add_development_dependency(%q<rspec>, ["~>  2.6"])
end

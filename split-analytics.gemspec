# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'split/analytics/version'

Gem::Specification.new do |gem|
  gem.authors       = ['Andrew Nesbitt']
  gem.email         = ['andrewnez@gmail.com']
  gem.summary       = 'Split extension to push test data to google analytics'
  gem.homepage      = 'https://github.com/splitrb/split-analytics'
  gem.license       = 'MIT'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'split-analytics'
  gem.require_paths = ['lib']
  gem.version       = Split::Analytics::VERSION

  gem.add_dependency('split', '>= 1.0.0')

  gem.add_development_dependency('rspec', '~> 3.1')
  gem.add_development_dependency('rake', '~> 10.4')
end

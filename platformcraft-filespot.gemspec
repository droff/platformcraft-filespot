# -*- encoding: utf-8 -*-
require File.expand_path('../lib/filespot/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["droff"]
  gem.email         = "adroff@gmail.com"
  gem.description   = "gem provides platformcraft filespot api"
  gem.summary       = "http://doc.platformcraft.ru/filespot/api/"
  gem.homepage      = "https://github.com/droff/platformcraft-filespot"

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'
  gem.add_dependency 'json'
  gem.add_dependency 'faraday'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "platformcraft-filespot"
  gem.require_paths = ["lib"]
  gem.version       = Filespot::VERSION
end

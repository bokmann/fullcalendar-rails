# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fullcalendar-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['bokmann','gr8bit']
  gem.email         = ['dbock@codesherpas.com','niklas@bichinger.de']
  gem.description   = %q{FullCalendar is a fantastic jQuery plugin that gives you an event calendar with tons of great AJAX wizardry, including drag and drop of events.  I like having managed pipeline assets, so I gemified it.}
  gem.summary       = %q{A simple asset pipeline bundling for Ruby on Rails of the FullCalendar jQuery plugin.}
  gem.homepage      = 'https://github.com/bokmann/fullcalendar-rails'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'fullcalendar-rails'
  gem.require_paths = ['lib']
  gem.version       = Fullcalendar::Rails::VERSION
  gem.license       = 'MIT'

  gem.add_runtime_dependency 'jquery-rails', '>= 4.0.5', '< 5.0.0'
  gem.add_runtime_dependency 'jquery-ui-rails', '>= 5.0.2'
  gem.add_runtime_dependency 'momentjs-rails', '>= 2.9.0'
  gem.add_development_dependency 'rake', '~> 0'
end

# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fullcalendar-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["bokmann"]
  gem.email         = ["dbock@codesherpas.com"]
  gem.description   = %q{FullCalendar is a fantastic jquery plugin that gives you an event calendar with tons of great ajax wizardry, incluing drag and drop of events.  I like having managed pipeline assets, so I gemified it.}
  gem.summary       = %q{A simple asset pipeline bundling of the fullcalendar jquery plugin.}
  gem.homepage      = "https://github.com/bokmann/fullcalendar-rails"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "fullcalendar-rails"
  gem.require_paths = ["lib"]
  gem.version       = Fullcalendar::Rails::VERSION
  
  gem.add_development_dependency "rake"
end

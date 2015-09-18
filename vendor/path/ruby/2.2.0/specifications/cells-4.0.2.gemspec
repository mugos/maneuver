# -*- encoding: utf-8 -*-
# stub: cells 4.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "cells"
  s.version = "4.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Nick Sutterer"]
  s.date = "2015-06-28"
  s.description = "Cells replaces partials and helpers with OOP view models, giving you proper encapsulation, inheritance, testability and a cleaner view architecture."
  s.email = ["apotonick@gmail.com"]
  s.homepage = "https://github.com/apotonick/cells"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "View Models for Ruby and Rails."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<uber>, ["~> 0.0.9"])
      s.add_runtime_dependency(%q<tilt>, ["< 3", ">= 1.4"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<minitest-reporters>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<cells-erb>, [">= 0.0.4"])
    else
      s.add_dependency(%q<uber>, ["~> 0.0.9"])
      s.add_dependency(%q<tilt>, ["< 3", ">= 1.4"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<minitest-reporters>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<cells-erb>, [">= 0.0.4"])
    end
  else
    s.add_dependency(%q<uber>, ["~> 0.0.9"])
    s.add_dependency(%q<tilt>, ["< 3", ">= 1.4"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<minitest-reporters>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<cells-erb>, [">= 0.0.4"])
  end
end

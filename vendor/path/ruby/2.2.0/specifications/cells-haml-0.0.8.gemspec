# -*- encoding: utf-8 -*-
# stub: cells-haml 0.0.8 ruby lib

Gem::Specification.new do |s|
  s.name = "cells-haml"
  s.version = "0.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Abdelkader Boudih", "Nick Sutterer"]
  s.date = "2015-06-09"
  s.description = "Haml integration for Cells"
  s.email = ["terminale@gmail.com", "apotonick@gmail.com"]
  s.homepage = "https://github.com/trailblazer/cells-haml"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Haml integration for Cells"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cells>, ["~> 4.0.0.beta6"])
      s.add_runtime_dependency(%q<haml>, [">= 4.1.0.beta.1"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<cells>, ["~> 4.0.0.beta6"])
      s.add_dependency(%q<haml>, [">= 4.1.0.beta.1"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<cells>, ["~> 4.0.0.beta6"])
    s.add_dependency(%q<haml>, [">= 4.1.0.beta.1"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end

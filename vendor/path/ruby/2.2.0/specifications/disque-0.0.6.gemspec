# -*- encoding: utf-8 -*-
# stub: disque 0.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "disque"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Michel Martens", "Damian Janowski"]
  s.date = "2015-06-04"
  s.description = "Disque client for Ruby"
  s.email = ["michel@soveran.com", "damian.janowski@gmail.com"]
  s.homepage = "https://github.com/soveran/disque-rb"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Client for Disque"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<redic>, ["~> 1.5.0"])
    else
      s.add_dependency(%q<redic>, ["~> 1.5.0"])
    end
  else
    s.add_dependency(%q<redic>, ["~> 1.5.0"])
  end
end

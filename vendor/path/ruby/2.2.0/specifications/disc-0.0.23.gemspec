# -*- encoding: utf-8 -*-
# stub: disc 0.0.23 ruby lib

Gem::Specification.new do |s|
  s.name = "disc"
  s.version = "0.0.23"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["pote"]
  s.date = "2015-09-14"
  s.description = "Easily define and run background jobs using Disque"
  s.email = ["pote@tardis.com.uy"]
  s.executables = ["disc"]
  s.files = ["bin/disc"]
  s.homepage = "https://github.com/pote/disc"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "A simple and powerful Disque job implementation"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<disque>, ["~> 0.0.6"])
      s.add_runtime_dependency(%q<msgpack>, ["<= 0.6.2", ">= 0.5.6"])
      s.add_runtime_dependency(%q<clap>, ["~> 1.0"])
    else
      s.add_dependency(%q<disque>, ["~> 0.0.6"])
      s.add_dependency(%q<msgpack>, ["<= 0.6.2", ">= 0.5.6"])
      s.add_dependency(%q<clap>, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<disque>, ["~> 0.0.6"])
    s.add_dependency(%q<msgpack>, ["<= 0.6.2", ">= 0.5.6"])
    s.add_dependency(%q<clap>, ["~> 1.0"])
  end
end

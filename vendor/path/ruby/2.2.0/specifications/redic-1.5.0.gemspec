# -*- encoding: utf-8 -*-
# stub: redic 1.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "redic"
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Michel Martens", "Cyril David"]
  s.date = "2015-05-12"
  s.description = "Lightweight Redis Client"
  s.email = ["michel@soveran.com", "cyx@cyx.is"]
  s.homepage = "https://github.com/amakawa/redic"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Lightweight Redis Client"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hiredis>, [">= 0"])
    else
      s.add_dependency(%q<hiredis>, [">= 0"])
    end
  else
    s.add_dependency(%q<hiredis>, [">= 0"])
  end
end

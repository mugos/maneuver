# -*- encoding: utf-8 -*-
# stub: minitest-metadata 0.5.3 ruby lib

Gem::Specification.new do |s|
  s.name = "minitest-metadata"
  s.version = "0.5.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Wojciech Mach"]
  s.date = "2014-06-15"
  s.description = "Metadata (key-value) support for minitest/spec"
  s.email = ["wojtek@wojtekmach.pl"]
  s.homepage = ""
  s.rubyforge_project = "minitest-metadata"
  s.rubygems_version = "2.4.5"
  s.summary = "Metadata (key-value) support for minitest/spec"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitest>, ["< 6.0", ">= 4.7"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<minitest>, ["< 6.0", ">= 4.7"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<minitest>, ["< 6.0", ">= 4.7"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end

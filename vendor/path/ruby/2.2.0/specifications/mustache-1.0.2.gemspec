# -*- encoding: utf-8 -*-
# stub: mustache 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "mustache"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Chris Wanstrath", "Magnus Holm", "Pieter van de Bruggen", "Ricardo Mendes"]
  s.date = "2015-06-24"
  s.description = "Inspired by ctemplate, Mustache is a framework-agnostic way to render\nlogic-free views.\n\nAs ctemplates says, \"It emphasizes separating logic from presentation:\nit is impossible to embed application logic in this template\nlanguage.\n\nThink of Mustache as a replacement for your views. Instead of views\nconsisting of ERB or HAML with random helpers and arbitrary logic,\nyour views are broken into two parts: a Ruby class and an HTML\ntemplate.\n"
  s.email = "rokusu@gmail.com"
  s.executables = ["mustache"]
  s.files = ["bin/mustache"]
  s.homepage = "https://github.com/mustache/mustache"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new("~> 2.0")
  s.rubygems_version = "2.4.5"
  s.summary = "Mustache is a framework-agnostic way to render logic-free views."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rake>, ["~> 10.3"])
      s.add_development_dependency(%q<minitest>, ["~> 5.4"])
      s.add_development_dependency(%q<benchmark-ips>, [">= 0"])
      s.add_development_dependency(%q<ruby-prof>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.1"])
      s.add_development_dependency(%q<ronn>, ["~> 0.7"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rake>, ["~> 10.3"])
      s.add_dependency(%q<minitest>, ["~> 5.4"])
      s.add_dependency(%q<benchmark-ips>, [">= 0"])
      s.add_dependency(%q<ruby-prof>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 4.1"])
      s.add_dependency(%q<ronn>, ["~> 0.7"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rake>, ["~> 10.3"])
    s.add_dependency(%q<minitest>, ["~> 5.4"])
    s.add_dependency(%q<benchmark-ips>, [">= 0"])
    s.add_dependency(%q<ruby-prof>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 4.1"])
    s.add_dependency(%q<ronn>, ["~> 0.7"])
  end
end

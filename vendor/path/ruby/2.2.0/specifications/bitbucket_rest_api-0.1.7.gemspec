# -*- encoding: utf-8 -*-
# stub: bitbucket_rest_api 0.1.7 ruby lib

Gem::Specification.new do |s|
  s.name = "bitbucket_rest_api"
  s.version = "0.1.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mike Cochran"]
  s.date = "2015-07-29"
  s.description = " Ruby wrapper for the BitBucket API supporting OAuth and Basic Authentication "
  s.email = "mcochran@linux.com"
  s.homepage = "https://github.com/vongrippen/bitbucket"
  s.rubygems_version = "2.4.5"
  s.summary = "Ruby wrapper for the BitBucket API supporting OAuth and Basic Authentication"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hashie>, [">= 0"])
      s.add_runtime_dependency(%q<faraday>, ["~> 0.9.0"])
      s.add_runtime_dependency(%q<multi_json>, ["< 2.0", ">= 1.7.5"])
      s.add_runtime_dependency(%q<faraday_middleware>, ["~> 0.9.0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.5.2"])
      s.add_runtime_dependency(%q<simple_oauth>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<webmock>, ["~> 1.8.0"])
      s.add_development_dependency(%q<vcr>, ["~> 2.2.0"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.6.1"])
      s.add_development_dependency(%q<guard>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<guard-cucumber>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
    else
      s.add_dependency(%q<hashie>, [">= 0"])
      s.add_dependency(%q<faraday>, ["~> 0.9.0"])
      s.add_dependency(%q<multi_json>, ["< 2.0", ">= 1.7.5"])
      s.add_dependency(%q<faraday_middleware>, ["~> 0.9.0"])
      s.add_dependency(%q<nokogiri>, [">= 1.5.2"])
      s.add_dependency(%q<simple_oauth>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<webmock>, ["~> 1.8.0"])
      s.add_dependency(%q<vcr>, ["~> 2.2.0"])
      s.add_dependency(%q<simplecov>, ["~> 0.6.1"])
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<guard-cucumber>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
    end
  else
    s.add_dependency(%q<hashie>, [">= 0"])
    s.add_dependency(%q<faraday>, ["~> 0.9.0"])
    s.add_dependency(%q<multi_json>, ["< 2.0", ">= 1.7.5"])
    s.add_dependency(%q<faraday_middleware>, ["~> 0.9.0"])
    s.add_dependency(%q<nokogiri>, [">= 1.5.2"])
    s.add_dependency(%q<simple_oauth>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<webmock>, ["~> 1.8.0"])
    s.add_dependency(%q<vcr>, ["~> 2.2.0"])
    s.add_dependency(%q<simplecov>, ["~> 0.6.1"])
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<guard-cucumber>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
  end
end

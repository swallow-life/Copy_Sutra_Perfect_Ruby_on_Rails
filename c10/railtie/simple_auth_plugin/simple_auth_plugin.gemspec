$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_auth_plugin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_auth_plugin"
  s.version     = SimpleAuthPlugin::VERSION
  s.authors     = ["swallow-life"]
  s.email       = ["mshk_stt@yahoo.co.jp"]
  #10.30
  s.homepage    = ""
  s.summary     = "Simple auth plugin for Rails."
  s.description = "Simple auth plugin for Rails. For Rails book"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
end

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sermepa/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sermepa"
  s.version     = Sermepa::VERSION
  s.authors     = ["Endika Gutiérrez"]
  s.email       = ["me@endika.net"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Sermepa."
  s.description = "TODO: Description of Sermepa."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "savon", "~> 2.0.2"
  
  s.add_development_dependency "sqlite3"
end

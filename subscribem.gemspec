# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'subscribem/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'subscribem'
  s.version     = Subscribem::VERSION
  s.authors     = ['Mark Hoad']
  s.email       = ['markdhoad@gmail.com']
  s.homepage    = 'https://github.com/mhoad/subscribem-engine'
  s.summary     = 'Rails Engine to provide multitenancy functionality'
  s.description = 'Based on the book Multitenancy with Rails'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1.1'
  s.add_dependency 'devise'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'capybara', '~> 2.7'
  s.add_development_dependency 'rspec-rails', '~> 3.5'
  s.add_development_dependency 'factory_girl_rails', '~> 4.0'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'email_spec', '~> 2.1'
end

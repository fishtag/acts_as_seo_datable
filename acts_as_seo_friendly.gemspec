$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'acts_as_seo_friendly/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'acts_as_seo_friendly'
  s.version     = ActsAsSeoFriendly::VERSION
  s.authors     = ['Timur Khafizov']
  s.email       = ['timur.khafizov@fishtag.ru']
  s.homepage    = 'https://github.com/fishtag/acts_as_seo_friendly'
  s.summary     = 'Summary of ActsAsSeoFriendly.'
  s.description = 'Description of ActsAsSeoFriendly.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.0'
  s.add_dependency 'meta-tags', '~> 2.0.0'

  s.add_development_dependency 'pg'
end

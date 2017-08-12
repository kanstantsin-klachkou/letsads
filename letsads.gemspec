lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'letsads/version'

Gem::Specification.new do |s|
  s.name        = 'letsads'
  s.version     = Letsads::VERSION
  s.date        = '2017-08-10'
  s.summary     = 'Ruby client for SMS Service API letsads.com'
  s.description = 'This Gem provide abilities to communicate with letsads.com API through simple methods'
  s.authors     = ['Kanstansin Klachkou']
  s.email       = 'kanstantsin.klachkou@gmail.com'
  s.files       = ['lib/letsads.rb', 'lib/letsads/version.rb', 'Gemfile', 'letsads.gemspec', 'LICENSE']
  s.homepage    =
    'http://rubygems.org/gems/letsads'
  s.license     = 'MIT'

  s.add_runtime_dependency 'rest-client', '~> 2.0'

  s.add_development_dependency 'rspec', '~> 3.6'
  s.add_development_dependency 'webmock', '~> 3.0'
  s.add_development_dependency 'pry'
end

# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'squib_plus'
  s.version       = '0.0.1'
  s.files         = `git ls-files -z`.split("\x0")

  s.authors     = ['Rob Newton']
  s.summary     = 'Extensions for Squib'
  s.description = 'Helper functions extending the functionality of Squib'
  s.email       = 'robert@coinflip.games'
  s.homepage    = 'https://rubygems.org/gems/squib_plus'
  s.license     = 'MIT'
end

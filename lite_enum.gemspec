$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = 'lite_enum'
  s.version = '0.1.0'
  s.required_ruby_version = Gem::Requirement.new('>= 2.0.0')
  s.authors = ['Adam Becker']
  s.summary = 'Lightweight Enum class'
  s.email = 'adam@dobt.co'
  s.license = 'MIT'
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {features,spec}/*`.split("\n")
  s.homepage = 'http://github.com/dobtco/lite_enum'

  s.add_dependency 'activesupport'
  s.add_development_dependency 'rspec-rails', '3.1.0'
end

Gem::Specification.new do |s|
  s.name        = 'pluginist'
  s.version     = '0.0.3'
  s.date        = '2020-05-18'
  s.email       = ''
  s.summary     = 'Generic plugin system'
  s.description = 'Generic plugin system for ruby applications'
  s.authors     = ['rick2600']
  s.files       = [
                    'lib/pluginist.rb',
                    'lib/pluginist/exception.rb',
                    'lib/pluginist/manager.rb',
                    'lib/pluginist/plugin.rb']
  s.homepage    = 'https://github.com/rick2600/pluginist'
  s.license     = 'MIT'

  s.add_dependency('activemodel', '>=5.2.3')
  s.add_dependency('activesupport', '>=5.2.3')
  s.add_dependency('active_model_attributes', '1.3.0')
end

Gem::Specification.new do |s|
  s.name        = 'trilateration'
  s.version     = '0.0.1'
  s.date        = '2014-05-29'
  s.summary     = "Performs a trilateration operation in order to find an unknown point in a Cartesian coordinate system."
  s.description = "Trilateration calculates the position of an unknown point, using the distance from three known points to it."
  s.authors     = ["Patrick Read"]
  s.email       = 'pread13@gmail.com'
  s.files       = %w(LICENSE README.md trilateration.gemspec)
  s.files       += Dir.glob('lib/**/*.rb')
  s.files       += Dir.glob('spec/**/*')
  s.test_files  = Dir.glob('tests/**/*')
  s.homepage    = 'https://github.com/patrickread/trilateration'
  s.license     = 'MIT'
end
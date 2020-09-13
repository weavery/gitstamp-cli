Gem::Specification.new do |gem|
  gem.version            = File.read('VERSION').chomp
  gem.date               = File.mtime('VERSION').strftime('%Y-%m-%d')

  gem.name               = 'gitstamp'
  gem.homepage           = 'https://github.com/artob/gitstamp-cli'
  gem.license            = 'Unlicense'
  gem.summary            = 'Gitstamp Command-Line Interface (CLI)'
  gem.description        = gem.summary

  gem.author             = 'Arto Bendiken'
  gem.email              = 'arto@bendiken.net'

  gem.metadata = {
    'bug_tracker_uri'   => 'https://github.com/artob/gitstamp-cli/issues',
    'changelog_uri'     => 'https://github.com/artob/gitstamp-cli/blob/master/CHANGES.md',
    'documentation_uri' => 'https://www.rubydoc.info/github/artob/gitstamp-cli/master',
    'homepage_uri'      => 'https://gitstamp.dev',
    'source_code_uri'   => 'https://github.com/artob/gitstamp-cli',
  }

  gem.platform           = Gem::Platform::RUBY
  gem.files              = %w(AUTHORS CHANGES.md CREDITS.md README.md UNLICENSE VERSION) + Dir.glob('lib/**/*.rb')
  gem.bindir             = %q(bin)
  gem.executables        = %w(gitstamp)
  gem.require_paths      = %w(lib)
  gem.extensions         = %w()
  gem.test_files         = %w()

  gem.required_ruby_version      = '>= 2.4.0'
  gem.required_rubygems_version  = '>= 2.6.8' # Ruby 2.4.0
  gem.requirements               = []
  gem.add_development_dependency 'rake',      '>= 13'
  gem.add_development_dependency 'rspec',     '>= 3.9'
  gem.add_development_dependency 'yard' ,     '>= 0.9'
  gem.add_runtime_dependency     'arweave',   '~> 1.1'
  gem.add_runtime_dependency     'rugged',    '~> 1.0'
  gem.add_runtime_dependency     'thor',      '~> 1.0'
  gem.post_install_message       = nil
end

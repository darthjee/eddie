require 'arstotzka'

autoload :Application,     'lib/application'
autoload :Archtecture,     'lib/archtecture'
autoload :Config,          'lib/config'
autoload :Container,       'lib/container'
autoload :ComposerBuilder, 'lib/composer_builder'
autoload :Setup,           'lib/setup'

support_files = File.expand_path('config/**/*.rb')
Dir[support_files].sort.each { |file| require file }

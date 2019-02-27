lib = File.expand_path('.', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'lib/composer_builder'

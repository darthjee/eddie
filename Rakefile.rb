lib = File.expand_path('.', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

desc "Build integration docker-compose file"

task :build do
  require 'lib/loader'

  ComposerBuilder.new.build
end

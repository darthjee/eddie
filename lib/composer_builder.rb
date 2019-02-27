require "yaml"

require 'lib/composer_builder/config'

class ComposerBuilder
  def config
    @config ||= Config.new(yml_config)
  end

  private

  def yml_config
    YAML::load(File.open('applications.yml'))
  end
end

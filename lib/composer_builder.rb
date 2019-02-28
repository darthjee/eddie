require "yaml"

require 'lib/config'
require 'lib/application'

class ComposerBuilder
  def build
    puts applications.map(&:services).flatten.map(&:name)
  end

  private

  delegate :active_applications, to: :config

  def applications
    @applications ||= active_applications.map do |application|
      Application.new(application)
    end
  end

  def config
    @config ||= Config.new(yml_config)
  end

  def yml_config
    YAML::load(File.open('applications.yml'))
  end
end

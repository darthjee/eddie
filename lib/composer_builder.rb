require "yaml"

require 'lib/setup'
require 'lib/config'

class ComposerBuilder
  def build
    puts config.applications.map(&:application).map(&:containers).flatten.map(&:name)
  end

  private

  delegate :active_applications, to: :setup

  def applications
    @applications ||= active_applications.map do |application|
      Application.new(application)
    end
  end

  def config
    @config ||= Config.new(
      hash_from_yml('applications.yml'),
      active_applications.map.map(&:name)
    )
  end

  def setup
    @setup ||= Setup.new(hash_from_yml('setup.yml'))
  end

  def hash_from_yml(file_name)
    YAML::load(File.open(file_name))
  end
end

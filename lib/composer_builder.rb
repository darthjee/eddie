require "yaml"

require 'active_support/core_ext/module/delegation'

class ComposerBuilder
  def build
    puts config.applications.map(&:build).map(&:containers).flatten.map(&:name)

    puts "================="

    puts applications
  end

  private

  delegate :active_applications, to: :setup

  def applications
    @applications ||= active_applications.map do |application|
      Application.new(application)
    end
  end

  def config
    @config ||= Archtecture.new(
      hash_from_yml('archtecture.yml'),
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

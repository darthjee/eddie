require 'lib/service'
require 'arstotzka'

class Application

  delegate :name, :active, :local, to: :config

  def initialize(config)
    @config = config
  end

  def services
    @services ||= yml_config['services'].map do |name, config|
      Service.new(name, config)
    end
  end

  private

  attr_reader :config

  def yml_config
    YAML::load(File.open("#{name}/docker-compose.yml"))
  end
end

require 'lib/config/application'

class Config
  attr_reader :config, :active_applications

  def initialize(config, active_applications)
    @config = config
    @active_applications = active_applications
  end
end

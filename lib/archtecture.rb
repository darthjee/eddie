class Archtecture
  autoload :Application, 'lib/archtecture/application'
  autoload :Container,   'lib/archtecture/container'

  def initialize(config, active_applications)
    @config = config
    @active_applications = active_applications
  end

  def applications
    @applications ||= active_applications.map do |name|
      Application.new(name, config[name])
    end
  end

  private

  attr_reader :config, :active_applications
end

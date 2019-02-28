class Service
  attr_reader :name, :config

  def initialize(name, config)
    @name = name
    @config = config
  end
end

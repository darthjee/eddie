class Application
  delegate :name, :active, :local, to: :config

  def initialize(config)
    @config = config
  end

  private

  attr_reader :config
end

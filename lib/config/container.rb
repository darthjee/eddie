class Config
  class Container
    attr_reader :type, :application

    def initialize(type, application)
      @type = type
      @application = application
    end
  end
end

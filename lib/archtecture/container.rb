class Archtecture
  class Container
    attr_reader :type, :application

    def initialize(type, application)
      @type = type
      @application = application
    end

    def require_db?
      %w[api worker].include?(type)
    end

    def require_redis?
      type == 'worker'
    end
  end
end

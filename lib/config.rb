require 'arstotzka'

class Config
  include Arstotzka

  class << self
    def instance
      @instance ||= new
    end

    def reset
      @instance = nil
    end

    def configure(hash)
      @instance = new(hash)
    end
  end

  expose :docker_namespace

  def initialize(hash = {})
    @hash = hash
  end
end

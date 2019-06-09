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

    def configure(settings)
      @instance = new(settings)
    end
  end

  expose :docker_namespace, :docker_domain

  def initialize(settings = {})
    @settings = settings
  end

  private

  attr_reader :settings
end

require 'arstotzka'
require 'lib/config/container'

class Config
  class Application
    include Arstotzka

    attr_reader :name, :hash
    expose :containers, after: :container_for, json: :hash

    def initialize(name, hash)
      @name = name
      @hash = hash
    end

    private

    def container_for(type)
      Container.new(type, self)
    end
  end
end

require 'arstotzka'

class Setup
  class Application
    include Arstotzka

    expose :active, :local, default: false

    def initialize(name, hash)
      @name = name
      @hash = hash
    end

    attr_reader :name
  end
end


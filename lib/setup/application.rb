require 'arstotzka'

class Setup
  class Application
    include Arstotzka

    expose :active, :local, json: :hash, default: false

    def initialize(name, hash)
      @name = name
      @hash = hash
    end

    attr_reader :name, :hash
  end
end


require 'arstotzka'

class Config
  class Application
    include Arstotzka

    expose :active, :local, json: :hash

    def initialize(name, hash)
      @name = name
      @hash = hash
    end

    attr_reader :name, :hash
  end
end

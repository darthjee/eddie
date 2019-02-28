require 'arstotzka'
require 'lib/config/container'
require 'lib/application'

class Config
  class Application
    include Arstotzka

    attr_reader :name, :hash

    def initialize(name, hash)
      @name = name
      @hash = hash
    end

    def application
      ::Application.new(name, all_containers)
    end

    private

    expose :containers, json: :hash, cached: true

    def all_containers
      @resource_containers ||= containers.dup.tap do |list|
        list << 'db' if containers.any? { |name| %w[api worker].include?(name) }
        list << 'redis' if containers.include? 'worker'
      end
    end
  end
end

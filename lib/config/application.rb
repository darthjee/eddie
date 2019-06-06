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

    def build
      ::Application.new(name, all_containers)
    end

    private

    expose :containers, after_each: :container_for, json: :hash, cached: true

    def all_containers
      @resource_containers ||= containers.map(&:type).tap do |list|
        list << 'db' if containers.any?(&:require_db?)
        list << 'redis' if containers.any?(&:require_redis?)
      end
    end

    def container_for(type)
      Container.new(type, self)
    end
  end
end

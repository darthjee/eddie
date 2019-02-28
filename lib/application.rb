require 'lib/container'

class Application
  attr_reader :name, :container_types

  def initialize(name, container_types)
    @name = name
    @container_types = container_types
  end

  def containers
    @containers ||= container_types.map do |container_type|
      Container.from(container_type, self)
    end
  end
end

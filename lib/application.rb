require 'lib/container'

class Application
  attr_reader :name

  def initialize(name, container_types)
    @name = name
    @container_types = container_types
  end

  def containers
    @containers ||= container_types.map do |container_type|
      Container.from(container_type, self)
    end
  end

  private

  attr_reader :container_types
end

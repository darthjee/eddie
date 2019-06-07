class Container
  attr_reader :name, :type

  def initialize(name, type)
    @name = name
    @type = type
  end

  def self.from(type, application)
    new(
      [application, type].join('-'),
      type
    )
  end
end
